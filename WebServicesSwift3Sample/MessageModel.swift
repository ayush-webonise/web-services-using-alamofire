
//  MessageModel.swift
//  WebServicesSwift3Sample

import Foundation
import ObjectMapper

class MessageModel: NSObject, Mappable {
    var messageDescription: String?
    
    required convenience init(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        messageDescription <- map["message"]
    }
}
