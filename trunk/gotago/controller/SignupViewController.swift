//
//  SignupViewController.swift
//  gotago
//
//  Created by Atin Amit on 6/9/16.
//  Copyright © 2016 Atin Amit. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var mobileNumber: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = false
        self.mobileNumber.becomeFirstResponder()
        self.navigationController?.navigationBar.backItem?.backBarButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.backItem?.backBarButtonItem
        self.mobileNumber.becomeFirstResponder()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
