//
//  ViewController.swift
//  auth0Test
//
//  Created by Zahedul Alam on 3/5/17.
//  Copyright © 2017 inov.io. All rights reserved.
//

import UIKit
import Lock

class ViewController: UIViewController {
    var viewFlag: Bool!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        viewFlag = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.showLoginController()
    }
    
    func showLoginController() {
        Lock
            .classic()
            .withOptions {
                $0.usernameStyle = [.Email]
                $0.allow = [.Login, .ResetPassword, .Signup]
                $0.customSignupFields = [
                    CustomTextField(name: "full_name", placeholder: "Full Name", icon: LazyImage(name: "ic_person", bundle: Lock.bundle))
                ]
            }
            .withStyle {
                $0.headerColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.00)
                $0.logo = LazyImage(name: "logo")
                $0.backgroundColor = UIColor.white
                $0.headerBlur = .light
                $0.hideTitle = true
                $0.primaryColor = UIColor(red:0.94, green:0.48, blue:0.29, alpha:1.00)
                $0.hideButtonTitle = true
                $0.titleColor = UIColor(red:0.87, green:0.39, blue:0.29, alpha:1.00)
            }
            .onAuth { credentials in
                print("Authenticated!")
            }
            .present(from: self)
    }


}

