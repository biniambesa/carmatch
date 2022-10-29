//
//  ContentView.swift
//  carmatch
//
//  Created by Sogah Mainib on 10/28/22.
//

import SwiftUI

enum Swipes {
    case UP
    case DOWN
    case RIGHT
    case LEFT
}
enum CurrentView {
    case CHATVIEW
    case IMGVIEW
    case MATCHEDLISTVIEW
}
struct ContentView: View {
    @ObservedObject var viewModel: CarMatchVM
    var body: some View {
      
        CardView(card: viewModel.cards[viewModel.idxOfCarShowing],viewModel: viewModel)
                    .frame(width: UIScreen.screenWidth - 25, height: 650) //change this to dynimic height and width size
                    .onTapGesture {
                        viewModel.flip(viewModel.cards[viewModel.idxOfCarShowing])
                    }
                    .foregroundColor(.teal)
        .padding(.horizontal)
        
    }
}
struct CardView: View{
    let card: CarMatch<Car>.Card
    @ObservedObject var viewModel: CarMatchVM
    var BottomBtns: some View{
        HStack{
            CustomButton(foreground:.teal,
                         background: .clear,
                         fontSize: 40,
                         icon: "list.bullet.clipboard",
                         action: {
                withAnimation(.easeOut) {
                    viewModel.viewToBePresented = .MATCHEDLISTVIEW}
                }
            )

            CustomButton(foreground: Color(UIColor.lightGray),
//                         background: Color(UIColor.lightGray),
                         background: .clear,
                         fontSize: 80,
                         icon: "xmark",
                         action: {
                withAnimation(.easeOut(duration: 1).delay(1)) {
                    viewModel.currCardIsNotLoved = true///theres got to be a cleaner way of doing this
                    viewModel.currCardIsLoved = false///theres got to be a cleaner way of doing this
                    viewModel.manageVerticalSwipes(card, swipeDirecion: .UP)
                }
            })
            CustomButton(foreground:.pink,
//                         background: .pink,
                         background: .clear,
                         fontSize: 70,
                         icon: "heart.fill",
                         action: {
                withAnimation(.easeOut(duration: 1).delay(1)) {
                    viewModel.currCardIsLoved = true///theres got to be a cleaner way of doing this
                    viewModel.currCardIsNotLoved = false///theres got to be a cleaner way of doing this
                    viewModel.manageVerticalSwipes(card, swipeDirecion: .DOWN)
                }
            })
            CustomButton(foreground:.teal,
                         background: .clear,
                         fontSize: 40,
                         icon: "text.bubble",
                         action: {
                withAnimation(.easeInOut(duration: 1)){
                    viewModel.flip(card)
                }
                }
            )
        }.padding(.bottom)
    }
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if(viewModel.viewToBePresented == .MATCHEDLISTVIEW ){
                shape.fill().foregroundColor(.white)
                VStack(alignment: .center){
                    Text("NO MATCHES YET... KEEP SWIPING : )").onTapGesture {
                        withAnimation(.easeOut) {
                            viewModel.viewToBePresented = .IMGVIEW
                        }
                    }
                }
            }else{
                if(card.isFaceUp == true){
                    shape.fill().foregroundColor(.white)
                    VStack(alignment: .center){
                        CardFront(card: card, viewModel: viewModel)
                        BottomBtns
                    }
                   
                }else{
                    ChatView(viewModel: viewModel, card: card)
                    
                }
            }
          
        }
    }
    

}



struct CardFront:View{
    let card: CarMatch<Car>.Card
    @ObservedObject var viewModel: CarMatchVM
    @State var isSwipping = false
    @State var startPos : CGPoint = .zero
    @State var isLoved = false
    @State var isNotLoved = false
    
    var ImgIndicator: some View{
        HStack(spacing:6){
            ForEach(card.content.imgs.indices, id: \.self){
                img in
                RoundedRectangle(cornerRadius: 3)
                    .fill()
                    .foregroundColor(viewModel.chosenImg == img ? .teal : .gray)
                    .frame(width: 10, height: 10)
            }
            
        }.padding(.bottom, 30.0)
    }
    
    var body: some View{
        ZStack(alignment: .center){
            Image(card.content.imgs[viewModel.chosenImg])
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.screenWidth - 25, height: 650) //change this to dynimic height and width size
                .cornerRadius(20)
                .padding()
                .overlay(ImgIndicator, alignment: .bottom)
                .offset(y: viewModel.offset.height * 5)
                .opacity(2 - Double(abs(viewModel.offset.height / 50)))
                .gesture(
                    DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                        .onChanged({ gesture in
                            if self.isSwipping {
                                self.startPos = gesture.location
                                self.isSwipping.toggle()
                            }})
                        .onEnded { gesture in
                            let xDist =  abs(gesture.location.x - self.startPos.x)
                            let yDist =  abs(gesture.location.y - self.startPos.y)
                            if self.startPos.y <  gesture.location.y && yDist > xDist {
                                withAnimation(.easeOut(duration: 1)) {
                                     viewModel.manageSwipes(card, swipeDirecion: Swipes.DOWN)
                                }}
                            else if self.startPos.y >  gesture.location.y && yDist > xDist {
                                withAnimation(.easeOut(duration: 1)) {
                                    viewModel.manageSwipes(card, swipeDirecion: Swipes.UP)
                                }}
                            else if self.startPos.x > gesture.location.x && yDist < xDist {
                                withAnimation {
                                    viewModel.manageSwipes(card, swipeDirecion: Swipes.LEFT)
                                }}
                            else if self.startPos.x < gesture.location.x && yDist < xDist {
                                withAnimation {
                                    viewModel.manageSwipes(card, swipeDirecion: Swipes.RIGHT)
                                }}
                            self.isSwipping.toggle()}
                ).transition(.slide)
   
            
//                                if moving up cancel car else like car?
//            if(viewModel.currCardIsNotLoved){
//                //                Image(systemName: "xmark")
//                Text("😒")
//                    .foregroundColor(.white)
//                //                .background(.gray)
//                    .font(Font.custom("HelveticaNeue-Bold", size: 100))
//                    .fontWeight(.light)
//                    .clipShape(RoundedRectangle(cornerRadius: 20))
//                    .opacity(viewModel.currCardIsNotLoved ? 1 : 0)
//                    .opacity(1)
//                    .onTapGesture {
////                        carImgVM.cancelOpacity = false
//                    }
//                
//            }else if(viewModel.currCardIsLoved){
//                //                Image(systemName: "heart.fill")
//                Text("😍")
//                    .foregroundColor(.white)
//                //                    .background(.pink)
//                    .font(Font.custom("HelveticaNeue-Bold", size: 100))
//                    .clipShape(RoundedRectangle(cornerRadius: 20))
//                    .opacity(viewModel.currCardIsLoved ? 1 : 0)
//                    .opacity(1)
//                    .onTapGesture {
////                        carImgVM.heartOpacity = false
//                    }
//
//            }
        }
    }
}










struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let carmatchvm = CarMatchVM()
        ContentView(viewModel: carmatchvm)
    }
}
