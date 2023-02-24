//
//  AddFeelingView.swift
//  MoodJourney
//
//  Created by Keyvan on 2/17/23.
//

import SwiftUI
import Kingfisher

struct AddFeelingView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject var vm: AddFeelingViewModel
    var body: some View {
        VStack {
            List {
                ForEach(vm.outputs.feelings) { feelingEntity in
                    switch feelingEntity.feelingType {
                    case .happy:
                        VStack {
                            Text("😂")
                            HStack {
                                if let reactions = feelingEntity.reactions?.allObjects as? [ReactionEntity] {
                                    ForEach(reactions) { reaction in
                                        if let emoji = reaction.emoji {
                                            KFAnimatedImage(URL(string: "https://media.giphy.com/media/o75ajIFH0QnQC3nCeD/giphy.gif"))
                                                .frame(maxWidth: .infinity)
                                                .cornerRadius(16)
                                                .aspectRatio(contentMode: .fit)
                                        }
                                    }
                                }
                            }
                        }.onTapGesture {
                            coordinator.push(.reaction(feeling: feelingEntity))
                        }

                    case .sad:
                        Text("😭")
                    case .depressed:
                        Text("😞")
                    }
                }
            }
            .onAppear {
                vm.inputs.fetchFeelings()
            }
            HStack(spacing: 16) {
                ForEach((1...3), id: \.self) { i in
                    ZStack {
                        if i == 1 {
                            Text("😭")
                                .zIndex(2)
                                .font(.system(.largeTitle))
                        }
                        if i == 2 {
                            Text("😂")
                                .zIndex(2)
                                .font(.system(.largeTitle))
                        }
                        if i == 3 {
                            Text("😞")
                                .zIndex(2)
                                .font(.system(.largeTitle))
                        }

                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor((i==vm.outputs.selectedFeelingIndex) ? Color.green : Color.gray.opacity(0.3) )
                            .frame(width: 80)
                            .frame(height: 80)
                    }.onTapGesture {
                        withAnimation {
                            vm.inputs.didSelectFeeling(atIndex: i)
                        }
                    }
                }
            }
            .padding(.horizontal, 16)

            Button {
                vm.didTapSubmitButton()
            } label: {
                Text("Submit")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .font(.headline)
                    .background(Color.green)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 16)
        }

    }
}

struct AddFeelingView_Previews: PreviewProvider {
    static var previews: some View {
        AddFeelingView(vm: AddFeelingViewModel())
    }
}

// @available(iOS 13.0, *)
// struct KFAnimatedImage: UIViewRepresentable {
//
//    var resource: Resource?
//
//    func makeUIView(context: Context) -> AnimatedImageView {
//        return AnimatedImageView()
//    }
//
//    func updateUIView(_ uiView: AnimatedImageView, context: Context) {
//        uiView.kf.setImage(with: resource)
//    }
//
// }
