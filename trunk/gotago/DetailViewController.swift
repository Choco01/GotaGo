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
    
    var fruit: Fruit?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let fruit = fruit {
            navigationItem.title = fruit.name?.capitalizedString
            imageView.image = UIImage(named: fruit.name!.lowercaseString)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
