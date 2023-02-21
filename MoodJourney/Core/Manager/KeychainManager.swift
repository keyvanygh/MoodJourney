import Foundation

struct KeychainManager {
    // MARK: Types
    
    enum KeychainError: Error {
        case noUserID
        case unexpectedItemData
        case unhandledError
        case notFound
    }
    
    // MARK: Properties
    
    private(set) var accessGroup: String?
    private let account = "moodjourny.com"
    
    // MARK: Keychain access
    
    func read(_ service: Service) throws -> String {
        /*
         Build a query to find the item that matches the service, account and
         access group.
         */
        var query = keychainQuery(withService: service)
        query[kSecMatchLimit as String] = kSecMatchLimitOne
        query[kSecReturnAttributes as String] = kCFBooleanTrue
        query[kSecReturnData as String] = kCFBooleanTrue
        
        // Try to fetch the existing keychain item that matches the query.
        var queryResult: AnyObject?
        let status = withUnsafeMutablePointer(to: &queryResult) {
            SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0))
        }
        
        // Check the return status and throw an error if appropriate.
        guard status != errSecItemNotFound else { throw KeychainError.notFound}
        guard status == noErr else { throw KeychainError.unhandledError }
        
        // Parse the password string from the query result.
        guard let existingItem = queryResult as? [String: AnyObject],
              let data = existingItem[kSecValueData as String] as? Data,
              let item = String(data: data, encoding: String.Encoding.utf8)
        else {
            throw KeychainError.unexpectedItemData
        }
        
        return item
    }
    
    
    func save(data: Data,to service: Service) throws {
        // Encode the password into an Data object.
//        let encodedPassword = password.data(using: String.Encoding.utf8)!
        
        do {
            // Check for an existing item in the keychain.
            try _ = read(service)
            
            // Update the existing item with the new password.
            var attributesToUpdate = [String: AnyObject]()
            attributesToUpdate[kSecValueData as String] = data as AnyObject?
            
            let query = keychainQuery(withService: service)
            let status = SecItemUpdate(query as CFDictionary, attributesToUpdate as CFDictionary)
            
            // Throw an error if an unexpected status was returned.
            guard status == noErr else { throw KeychainError.unhandledError }
        } catch KeychainError.notFound {
            /*
             No password was found in the keychain. Create a dictionary to save
             as a new keychain item.
             */
            var newItem = keychainQuery(withService: service)
            newItem[kSecValueData as String] = data as AnyObject?
            
            // Add a the new item to the keychain.
            let status = SecItemAdd(newItem as CFDictionary, nil)
            
            // Throw an error if an unexpected status was returned.
            guard status == noErr else { throw KeychainError.unhandledError }
        }
    }
    
    func delete(_ service: Service) throws {
        
        // Delete the existing item from the keychain.
        let query = keychainQuery(withService: service)
        let status = SecItemDelete(query as CFDictionary)
        
        // Throw an error if an unexpected status was returned.
        guard status == noErr || status == errSecItemNotFound else { throw KeychainError.unhandledError }
    }
    
    // MARK: Convenience
    
    private func keychainQuery(withService service: Service) -> [String: AnyObject] {
        var query = [String: AnyObject]()
        query[kSecClass as String] =
        (service == .userID) ? kSecClassIdentity : kSecAttrTokenID
        query[kSecAttrService as String] = service as AnyObject?
        query[kSecAttrAccount as String] = account as AnyObject?
        
        if let accessGroup = accessGroup {
            query[kSecAttrAccessGroup as String] = accessGroup as AnyObject?
        }
        
        return query
    }
}
