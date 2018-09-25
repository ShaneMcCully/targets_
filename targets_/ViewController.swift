//
//  ViewController.swift
//  targets_
//
//  Created by Shane McCully on 25/09/2018.
//  Copyright © 2018 Shane McCully. All rights reserved.
//

import UIKit

extension String {
    static var Empty = ""
}

class ViewController: UIViewController {

    @IBOutlet var backView: UIView!
    let targets = Target()

    @IBOutlet weak var endpointLabel: UILabel!
    @IBOutlet weak var endpointLabel2: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPress(_ sender: Any) {

        #if PRODUCTION
        let buildVariable = "PRODUCTION"
        print("targets_Production")
        print("Config.endpoint: \(Config.endpoint) + \(buildVariable)")
        backView.backgroundColor = Target.backColour
        endpointLabel.text = Target.whichBuildIsThis
        endpointLabel2.text = Config.endpoint

        #else
        let buildVariable = "DEBUG"
        print("targets_Debug")
        print("Config.endpoint: \(Config.endpoint) + \(buildVariable)")
        backView.backgroundColor = Target.backColour
        endpointLabel.text = Target.whichBuildIsThis
        endpointLabel2.text = Config.endpoint
        #endif

    }

}

class Config {

    static var endpoint: String {
        get {
            if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
                if let dic = NSDictionary(contentsOfFile: path) {
                    return dic["ENDPOINT_URL"] as? String ?? String.Empty
                }
            }
            return String.Empty
        }
    }
}

