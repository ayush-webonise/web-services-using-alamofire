//
//  ViewController.swift
//  WebServicesSwift3Sample
//
//  Created by webonise on 31/05/17.
//  Copyright © 2017 webonise. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let USER_NAME = "ayush"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Button Actions
    
    @IBAction func buttonActionGetRequest(_ sender: UIButton) {
        ModelAPIUtilityInstance.callGetWebService { (messageModel) in
            
            guard let messageModelLocal = messageModel else {return}
            self.pushToVC(messageModel: messageModelLocal)
        }
    }
    
    @IBAction func buttonActionPostRequest(_ sender: UIButton) {
        ModelAPIUtilityInstance.callPostWebService(userName: USER_NAME) { (messageModel) in
            
            guard let messageModelLocal = messageModel else {return}
            self.pushToVC(messageModel: messageModelLocal)
        }
    }
    
    @IBAction func buttonActionPutRequest(_ sender: UIButton) {
        ModelAPIUtilityInstance.callPutWebService(userName: USER_NAME) { (messageModel) in
            
            guard let messageModelLocal = messageModel else {return}
            self.pushToVC(messageModel: messageModelLocal)
        }
    }
    
    func pushToVC(messageModel: MessageModel) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let displayResultViewController = storyboard.instantiateViewController(
            withIdentifier: "DisplayResultViewController") as? DisplayResultViewController
        
        displayResultViewController?.messageModelInstance = messageModel
        self.navigationController?.pushViewController(displayResultViewController ?? DisplayResultViewController(), animated: true)
    }
}

