//
//  ViewController.swift
//  TouchID-Sampler
//
//  Created by ShinokiRyosei on 2017/08/15.
//  Copyright © 2017年 ShinokiRyosei. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func show() {

        let context = LAContext()
        var error: NSError? = nil
        context.localizedFallbackTitle = "Passcode"
        if context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthentication, error: &error) {

            context.evaluatePolicy(LAPolicy.deviceOwnerAuthentication, localizedReason: "サンプル確認のための認証チェック", reply: { (success, error) in

                if success {

                    print("認証成功")
                }
                else if let error = error {


                    switch (error as NSError).code {

                    case LAError.userFallback.rawValue:
                        break
//
//                        let context = LAContext()
//                        context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "サンプル確認のための認証チェック", reply: { (success, error) in
//
//                            
//                        })

                    default:
                        break
                    }
                    
                }
            })
        }
    }
}

