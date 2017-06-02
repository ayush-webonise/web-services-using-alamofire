
//  ModelAPIUtility.swift
//  WebServicesSwift3Sample

import Foundation
import ObjectMapper

let ModelAPIUtilityInstance = ModelAPIUtility()

class ModelAPIUtility {
    
    let BASE_URL = "http://10.0.0.171:6301/"
    //
    func callGetWebService(completionHandler: ((_ messageModel: MessageModel?) -> ())?) {
        
        //let parameters = ["user-name": userName]
        AlamofireUtilityInstance.getCallWithAlamofireUtility(url: BASE_URL,
                                                             requestParams: nil,
                                                             success: { (response) in
                                                                
                                                                if let response = response as? [String: Any],
                                                                    let messageModel = Mapper<MessageModel>().map(JSON: response) {
                                                                    print("messageModel: \(messageModel)")
                                                                    completionHandler!(messageModel)
                                                                } else {
                                                                    completionHandler!(nil)
                                                                }
                                                                
        },
                                                             failure: { (error) in
                                                                print(error ?? "error as default")
        })
        
    }
    
    //Post webservice call
    func callPostWebService(userName: String, completionHandler: ((_ messageModel: MessageModel?) -> ())?) {
        
        let parameters = ["user-name": userName]
        AlamofireUtilityInstance.postCallWith(url: BASE_URL,
                                              parameters: parameters as [String : AnyObject],
                                              showLoader: true,
                                              success: { (response) in
                                                
                                                if let response = response as? [String: Any],
                                                    let messageModel = Mapper<MessageModel>().map(JSON: response) {
                                                    print("messageModel: \(messageModel)")
                                                    completionHandler!(messageModel)
                                                } else {
                                                    completionHandler!(nil)
                                                }
        }, failure: { (error) in
            print(error)
        })
    }
    
    //Put webservice call
    func callPutWebService(userName: String, completionHandler: ((_ messageModel: MessageModel?) -> ())?) {
        
        let parameters = ["user-name": userName]
        AlamofireUtilityInstance.putCallWith(url: BASE_URL,
                                              parameters: parameters as [String : AnyObject],
                                              showLoader: true,
                                              success: { (response) in
                                                
                                                if let response = response as? [String: Any],
                                                    let messageModel = Mapper<MessageModel>().map(JSON: response) {
                                                    print("messageModel: \(messageModel)")
                                                    completionHandler!(messageModel)
                                                } else {
                                                    completionHandler!(nil)
                                                }
        }, failure: { (error) in
            print(error)
        })
    }
}
