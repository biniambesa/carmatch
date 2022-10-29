//
//  Chats.swift
//  carmatch
//
//  Created by Sogah Mainib on 10/23/22.
//

import Foundation

class Chats: ObservableObject {
    static let userOne = MsgUser(name: "Bini", avatar: "bini", isMsgSenderCurrentUser: true)
    static let userTwo = MsgUser(name: "user", avatar: "", isMsgSenderCurrentUser: false)
    @Published var realTimeMsgs = [
        Message(content: "Hello my friend", user: userOne),
        Message(content: "Hello my friend", user: userTwo),
        Message(content: "Hello my friend", user: userOne),
        Message(content: "Hello my friend", user: userTwo),
        Message(content: "Hello my friend", user: userOne),
        Message(content: "Hello my friend", user: userTwo),
    ]
    
    func sendMsg(_ chatMsg: Message){
        realTimeMsgs.append(chatMsg)
    }
    

}
