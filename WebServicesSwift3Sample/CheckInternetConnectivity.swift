
//  CheckInternetConnectivity.swift
//  WebServicesSwift3Sample

import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
