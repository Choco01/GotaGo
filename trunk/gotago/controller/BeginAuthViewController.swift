//
//  BeginAuthViewController.swift
//  gotago
//
//  Created by Atin Amit on 6/9/16.
//  Copyright © 2016 Atin Amit. All rights reserved.
//

import UIKit

class BeginAuthViewController: UIViewController {

    @IBOutlet weak var btnFacebook: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func btnFacebook_click(_ sender: UIButton) {
//        let fbLoginManager: FBSDKLoginManager = FBSDKLoginManager()
//        fbLoginManager.logInWithReadPermissions(["public_profile", "email"], fromViewController: self) { (result: FBSDKLoginManagerLoginResult!, error: NSError!) in
//            if result.isCancelled {
//                debugPrint("Cancelled")
//            } else if error != nil {
//                debugPrint("Error \(error.description)")
//            } else {
//                debugPrint("Authorized")
//                // Setup the Account on server with FB token details
//                let setupProfileViewController = self.storyboard?.instantiateViewControllerWithIdentifier("SetupProfileViewController") as? SetupProfileController
//                self.navigationController?.pushViewController(setupProfileViewController!, animated: true)
//            }
//        }
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
