//
//  ChatView.swift
//  carmatch
//
//  Created by Sogah Mainib on 10/23/22.
//

import SwiftUI


struct ChatView: View {
    @ObservedObject var viewModel: CarMatchVM
    @State var msgToBeSent: String = ""
    @EnvironmentObject var chats: Chats
    let card: CarMatch<Car>.Card
    
    var body: some View {
        
        VStack {
            HStack{
                Button {
                    withAnimation(.easeInOut(duration: 1)) {
                        viewModel.flip(card)
                    }
                } label: {
                    Image(systemName: "chevron.backward").font(.largeTitle).foregroundColor(.red)
                }
                
                Spacer()

            }
            List {
                ForEach(chats.realTimeMsgs, id: \.self) { msg in
                    ChatCell(curMsg: msg)
                        .listRowSeparator(.hidden)
                }
                
            }.background(.white).scrollContentBackground(.hidden)
            Spacer()
            HStack {
                ZStack {
//                         Color.white.ignoresSafeArea()
                         VStack(alignment: .leading) {
                             HStack {
                                 Image(systemName: "message")
                                 TextField("hi, is the vehicle available?", text: $msgToBeSent)
                             }.underlineTextField()
                         }
                     }
                Button(action: sendMessage) {
                    Text("Send")
                    
                }.frame(minHeight: CGFloat(50))
            }
        }.onAppear{
            print("hello we are at card")
        }
        
        
    }
    
    func sendMessage() {
        chats.sendMsg(Message(content: msgToBeSent, user: MsgUser(name: "no one", avatar: "", isMsgSenderCurrentUser: true)))
            msgToBeSent = ""
        }
}

//struct ChatCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatView()
//    }
//}

