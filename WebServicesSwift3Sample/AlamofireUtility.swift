
//  AlamofireUtility.swift
//  WebServicesSwift3Sample

import Foundation
import Alamofire

let AlamofireUtilityInstance = AlamofireUtility()

class AlamofireUtility {
    
    let headerParams: [String: String] = ["Content-Type": "application/json", "auth-key": "sab"]
    
    //Get Call
    func getCallWithAlamofireUtility(url: String,
                                     requestParams: Any? = [:],
                                     success: @escaping ((_ response: Any?)->()),
                                     failure: @escaping (_ error: NSError?)->()) {
        
        Alamofire.request(url, method: .get, parameters: requestParams as! [String: Any]?, encoding: JSONEncoding.default, headers: headerParams)
            .validate().responseJSON { (response) in
            if let error = response.result.error {
                failure(error as NSError)
            } else {
                success(response.result.value as Any?)
            }
            
        }
    }
    
    //Post Call
    func postCallWith(url: String,
                      parameters: [String: AnyObject] = [:],
                      showLoader: Bool = true,
                      success: @escaping ((_ response: AnyObject?)->()),
                      failure: @escaping (_ error: NSError)->()) {
        
        //internet check before making any call
        if Connectivity.isConnectedToInternet() {
            
            //show loading animation
            //            if showLoader {
            //                SwiftLoader.show(animated: true)
            //            }
            
            //            let delegate = Alamofire.Manager.sharedInstance.delegate
            //
            //            delegate.taskWillPerformHTTPRedirection = { session, task, response, request in
            //                return NSURLRequest(URL: NSURL(string: url)!)
            //            }
            
            //let param = parameters
            //param.add(accessTokenParameter)
            
            Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headerParams)
                .responseJSON { response in
                    
                    if showLoader {
                        //SwiftLoader.hide()
                    }
                    
                    if let error = response.result.error {
                        failure(error as NSError)
                    } else {
                        success(response.result.value as AnyObject?)
                    }
            }
          
        }
    }
    
    //Put Call
    func putCallWith(url: String,
                            parameters: [String: AnyObject] = [:],
                            showLoader: Bool = true,
                            success: @escaping ((_ response: AnyObject?)->()),
                            failure: @escaping (_ error: NSError)->()) {
        
        //internet check before making any call
        if Connectivity.isConnectedToInternet() {
            
            //show loading animation
            //SwiftLoader.show(animated: true)
            
            //let param = parameters
            //param.add(accessTokenParameter)
            
            //clear the cache before the get call
            URLCache.shared.removeAllCachedResponses()
            
            //            Alamofire.request(.PUT, url, parameters: param)
            //                .validate()
            //                .responseJSON { (response) in
            //
            //                    SwiftLoader.hide()
            //
            //                    if let error = response.result.error {
            //                        failure(error: error)
            //                    } else {
            //                        succeess(response: response.result.value)
            //                    }
            //            }
            Alamofire.request(url, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: headerParams)
                .validate()
                .responseJSON { response in
                    
                    //SwiftLoader.hide()
                    
                    if let error = response.result.error {
                        failure(error as NSError)
                    } else {
                        success(response.result.value as AnyObject?)
                    }
            }
        }
    }
}
