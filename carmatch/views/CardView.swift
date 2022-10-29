////
////  CardView.swift
////  carmatch
////
////  Created by Sogah Mainib on 10/25/22.
////
//
//import SwiftUI
//
//struct Cardify<Content1:View, Content2: View>: View,Animatable{
//    let card: CarMatch<Car>.CarCard
//    let front: (_ card: CarMatch<Car>.CarCard) -> Content1
//    let back: (_ card: CarMatch<Car>.CarCard) -> Content2
//    let borderColor:Color
//    var rotation: Double
//    var animatableData: Double {
//        get{
//            rotation
//        }
//        set{
//            rotation = newValue
//        }
//
//    }
//    init(@ViewBuilder frontOfCard: @escaping (_ card: CarMatch<Car>.CarCard) -> Content1,@ViewBuilder backOfCard: @escaping (_ card: CarMatch<Car>.CarCard) -> Content2, borderColor:Color, card: CarMatch<Car>.CarCard ) {
//        self.card = card
//        self.front = frontOfCard(self.card) as! (CarMatch<Car>.CarCard) -> Content1
//        self.back = backOfCard(self.card) as! (CarMatch<Car>.CarCard) -> Content2
//        self.borderColor = borderColor
//        self.rotation = self.card.isFrontUp ? 0 : 180
//    }
//
//
//    var body: some View {
//            ZStack(alignment: .center){
//                if rotation > 90{
//                    front(self.card )
//                        .padding()
//                        .frame(width: UIScreen.screenWidth - 25, height: UIScreen.screenHeight * 0.9)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 20)
//                                .stroke(.clear, lineWidth: 2)
//                        )
//                        .opacity( rotation > 90 ? 1: 0)
//                        .rotation3DEffect(Angle.degrees(180), axis: (0,1,0))
//                }
//                else{
//                    back(self.card)
//                    .padding()
//                    .frame(width: UIScreen.screenWidth - 25, height: UIScreen.screenHeight * 0.9)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 20)
//                            .stroke(.clear, lineWidth: 2)
//                    )
//                    .opacity( rotation < 90 ? 1: 0)
//                }
//
//            }.rotation3DEffect(Angle.degrees(rotation), axis: (0,1,0))
//        }
//
//}
//
