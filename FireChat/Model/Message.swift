//
//  Message.swift
//  FireChat
//
//  Created by Stanley Traub on 12/7/20.
//

import Firebase

struct Message {
    let text: String
    let toId: String
    let fromId: String
    var timestamp: Timestamp!
    let isFromCurrentUser: Bool
    var user: User?
    
    init(dictionary: [String: Any]) {
        self.text = dictionary["text"] as? String ?? ""
        self.toId = dictionary["toId"] as? String ?? ""
        self.fromId = dictionary["fromId"] as? String ?? ""
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())

        self.isFromCurrentUser = fromId == Auth.auth().currentUser?.uid
    }
}
