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
    
    fileprivate func createMenuView() {
        
        // create viewController code...
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "DashBoardViewController") as! DashBoardViewController
        let leftViewController = storyboard.instantiateViewController(withIdentifier: "LeftViewController") as! LeftViewController
        
        let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
        
        UINavigationBar.appearance().tintColor = UIColor(hex: "689F38")
        
        leftViewController.mainViewController = nvc
        
        let slideMenuController = ExSlideMenuController(mainViewController:nvc, leftMenuViewController: leftViewController)
        slideMenuController.automaticallyAdjustsScrollViewInsets = true
        slideMenuController.delegate = mainViewController
        self.navigationController?.pushViewController(slideMenuController, animated: false)
    }
    
    deinit{
        doNothing()
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:- prepareForSegue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        
        let dashboardViewController = segue.destination as! DashBoardViewController
        self.navigationController?.pushViewController(dashboardViewController, animated: true)
//        self.navigationController?.navigationBar.backItem?.backBarButtonItem
        
        self.createMenuView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)  
        self.setNavigationBarItem()
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.navigationBar.backItem?.backBarButtonItem
        
        //
    }
    
    func doNothing() {
        print("do nothing..!!")
    }
    @IBAction func continueButtonTapped(_ sender:UIButton){
        self.createMenuView()
    }
    
}
