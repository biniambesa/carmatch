////
////  AppIndex.swift
////  carmatch
////
////  Created by Sogah Mainib on 10/23/22.
////
//
//import SwiftUI
//struct AppIndex: View {
//    @State var cardToPresent:String = "IMGCARDVIEW"
//    @EnvironmentObject var mc: MainController
//    func updateCardToPresent(name: String)->Void{
//        cardToPresent = name
//    }
//    
//    var body: some View {
//        //this is the main/parent container for the views
//        VStack{
//            if(mc.viewToBePresented != "MATCHEDVIEW" ){
//
////                Cardify(frontOfCard: {card in
////                    ImgView(card: card)
////                }, backOfCard: {card in
////                    ChatView(card: card)
////                       }, borderColor: .teal, card: mc.cards[mc.idxOfCarShowing])
//
//            }else{
//                    MatchedListView()
//            }
//        }
//    }
//}
//
//
//struct AppIndex_Previews: PreviewProvider {
//    static var previews: some View {
//        AppIndex()
//    }
//}
//
////
////func updateImg(swipeDirection: String){
////    self.cardSwipeDir = swipeDirection
////    self.cardSwipeDir = swipeDirection
////
////    if(swipeDirection == "LEFT"){
////        print("IMG SWIPE \(swipeDirection)")
////        self.chosenImg = chosenImg == 0 ? arrayOfCarImages.count-1 : chosenImg - 1
////    }
////    if(swipeDirection == "RIGHT"){
////        print("IMG SWIPE \(swipeDirection)")
////        self.chosenImg = chosenImg == arrayOfCarImages.count-1 ? 0 : chosenImg + 1
////    }
////    if(swipeDirection == "UP"){
////        heartOpacity = false
////        withAnimation(Animation.spring().speed(0.2)) {
////            cancelOpacity = true
////        }
////        print("IMG SWIPE \(swipeDirection)")
////
////    }
////    if(swipeDirection == "DOWN"){
////        cancelOpacity = false
////        withAnimation(Animation.spring().speed(0.2)) {
////            heartOpacity = true
////        }
////        print("IMG SWIPE \(swipeDirection)")
////    }
////}
