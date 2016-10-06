//
//  InterestCollectionViewCell.swift
//  Carousel
//
//  Created by Saurabh Chakraborty on 20/07/16.
//  Copyright © 2016 Intelegencia. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {

    var interest: Interest! {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var featuredImageView: UIImageView!
    
    fileprivate func updateUI() {
        
        featuredImageView?.image! = interest.featuredImage
    }

}
