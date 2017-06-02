
//  DisplayResultViewController.swift
//  WebServicesSwift3Sample

import UIKit
import ObjectMapper

class DisplayResultViewController: UIViewController {

    @IBOutlet weak var labelCongratsMessage: UILabel!
    @IBOutlet weak var labelStatusMessage: UILabel!
    
    var messageModelInstance: MessageModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let jsonString = messageModelInstance?.toJSONString()
        print("JSON STRING: \(jsonString)")
        
        labelCongratsMessage.text = "Congratulations"
        labelStatusMessage.text = String(describing: (messageModelInstance?.messageDescription)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
