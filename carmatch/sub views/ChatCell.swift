//
//  ChatCell.swift
//  carmatch
//
//  Created by Sogah Mainib on 10/23/22.
//

import SwiftUI

struct Message:Hashable {
    var content: String
    var user: MsgUser
}
struct MsgUser:Hashable {
    var name: String
    var avatar: String
    var isMsgSenderCurrentUser: Bool = false
}

struct ChatCell: View {
    var curMsg: Message
    var body: some View {
        HStack(alignment: .bottom, spacing: 5) {
            if(curMsg.user.isMsgSenderCurrentUser){
                Spacer()
                Text(curMsg.content)
                    .padding(4)
                    .foregroundColor(curMsg.user.isMsgSenderCurrentUser ? Color.white : Color.black)
    //                .frame(width: .infinity)
                    .background(curMsg.user.isMsgSenderCurrentUser ? Color.blue : Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
                    .cornerRadius(10)
                
                Image(curMsg.user.avatar == "" ? "default_user" :curMsg.user
                    .avatar)
                          .resizable()
                          .frame(width: 40, height: 40, alignment: .center)
                          .cornerRadius(20)
            }else{
                Image(curMsg.user.avatar == "" ? "default_user" :curMsg.user
                    .avatar)
                          .resizable()
                          .frame(width: 40, height: 40, alignment: .center)
                          .cornerRadius(20)
                Text(curMsg.content)
                    .padding(4)
                    .foregroundColor(curMsg.user.isMsgSenderCurrentUser ? Color.white : Color.black)
    //                .frame(width: .infinity)
                    .background(curMsg.user.isMsgSenderCurrentUser ? Color.blue : Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
                    .cornerRadius(10)
            }
          
         }
    }
}

struct ChatCell_Previews: PreviewProvider {
    static var previews: some View {
        ChatCell(curMsg: Message(content: "Hello, is the car available", user: MsgUser(name: "bini", avatar: "bini")))
    }
}
