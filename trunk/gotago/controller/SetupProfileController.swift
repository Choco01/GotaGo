//
//  SetupProfileController.swift
//  gotago
//
//  Created by Atin Amit on 6/22/16.
//  Copyright © 2016 Atin Amit. All rights reserved.
//

import UIKit

class SetupProfileController: UIViewController {
    @IBOutlet weak var continueButton: UIButton!
    
    //    let name:String;
    
    //
    //    required init?(coder aDecoder: NSCoder) {
    ////        fatalError("init(coder:) has not been implemented")
    //    }
    private func createMenuView() {
        
        // create viewController code...
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let mainViewController = storyboard.instantiateViewControllerWithIdentifier("DashBoardViewController") as! DashBoardViewController
        let leftViewController = storyboard.instantiateViewControllerWithIdentifier("LeftViewController") as! LeftViewController
        
        let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
        
        //        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        //        appDelegate.window?.rootViewController = nvc
        
        UINavigationBar.appearance().tintColor = UIColor(hex: "689F38")
        
        leftViewController.mainViewController = nvc
        
        let slideMenuController = ExSlideMenuController(mainViewController:nvc, leftMenuViewController: leftViewController)
        slideMenuController.automaticallyAdjustsScrollViewInsets = true
        slideMenuController.delegate = mainViewController
        self.navigationController?.pushViewController(slideMenuController, animated: false)
        
        
        //        appDelegate.window?.backgroundColor = UIColor(red: 236.0, green: 238.0, blue: 241.0, alpha: 1.0)
        //        appDelegate.window?.rootViewController = slideMenuController
        //        appDelegate.window?.makeKeyAndVisible()
    }
    
    deinit{
        doNothing()
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
        self.navigationController?.navigationBarHidden = true
        //
    }
    
    func doNothing() {
        print("do nothing..!!")
    }
    @IBAction func continueButtonTapped(sender:UIButton){
        self.createMenuView()
    }
    
}