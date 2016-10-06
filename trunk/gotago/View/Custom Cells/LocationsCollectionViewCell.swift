//
//  LocationsCollectionViewCell.swift
//  Carousel
//
//  Created by Saurabh Chakraborty on 22/07/16.
//  Copyright © 2016 Intelegencia. All rights reserved.
//

import UIKit

class LocationsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var myLable: UILabel!
    
    var location: Locations! {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var featuredImageView: UIImageView!
    
    fileprivate func updateUI() {
        
        featuredImageView?.image! = location.featuredImage
    }
    
}
