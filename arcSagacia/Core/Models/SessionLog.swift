//
//  SessionLog.swift
//  arcSagacia
//
//  Created by Gustavo Dias on 04/05/23.
//

import Firebase

struct SessionLog: Codable {
    var id = UUID().uuidString
    let deviceID: String
    let deviceModel: String
    let systemVersion: String
    
    let timeStarted: Timestamp
    let timeFinished: Timestamp
    let secondsToRun: Float
}
