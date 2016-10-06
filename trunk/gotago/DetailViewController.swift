//
//  DashBoardViewController.swift
//  Carousel
//
//  Created by Saurabh Chakraborty on 20/07/16.
//  Copyright © 2016 Intelegencia. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var checkInDate: UIButton!
    @IBOutlet weak var checkOutDate: UIButton!
    
    @IBOutlet weak var avatar: UIImageView!
    
    var checkInSelected = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatar.layer.cornerRadius = 5.0
        avatar.layer.borderWidth = 4.0
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.clipsToBounds = true
    
    }

    func dateSelected(_ theNotification : Notification) {
        
        if let extractInfo = (theNotification as NSNotification).userInfo {
            //code to use the object sent from VC2, by extracting the object details
            print("DATE FROM ANOTHER VIEW IS .....!!!!", extractInfo)
            
//            let result : [String: Any] = extractInfo
            
            if let dateSelected = extractInfo["ObjectBeingSent"] as? String {
                // no error
                if(checkInSelected) {
                    checkInDate.setTitle(dateSelected, for: UIControlState())
                } else {
                    checkOutDate.setTitle(dateSelected, for: UIControlState())
                }
            }
            
//            extractInfo.stringValue
            
            
//            let dateStr: String = extractInfo as! [String:AnyObject]
            
//            if(checkInSelected) {
//                checkInDate.setTitle(extractInfo, forState: UIControlState.Normal)
//            } else {
//                checkOutDate.setTitle(extractInfo, forState: UIControlState.Normal)
//            }
        }
    }
    
    
    @IBAction func checkInClicked(_ sender: UIButton) {
        checkInSelected = true
        NotificationCenter.default.addObserver(self, selector: #selector(DetailViewController.dateSelected(_:)), name: NSNotification.Name(rawValue: "DateSelected"), object: nil)

    }
    
    
    @IBAction func checkOutClicked(_ sender: UIButton) {
        checkInSelected = false
        NotificationCenter.default.addObserver(self, selector: #selector(DetailViewController.dateSelected(_:)), name: NSNotification.Name(rawValue: "DateSelected"), object: nil)
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

//        let bookingSummaryVC = segue.destinationViewController as! BookingSummaryViewController
//        self.navigationController?.pushViewController(bookingSummaryVC, animated: true)
    }
}
