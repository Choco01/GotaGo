//
//  SauceCode+UIFont.swift
//  gotago
//
//  Created by Atin Amit on 6/10/16.
//  Copyright © 2016 Atin Amit. All rights reserved.
//

import UIKit

public extension UIFont {
    
    public func stringSize(_ string: String, constrainedToWidth width: Double) -> CGSize {
        return string.boundingRect(with: CGSize(width: width, height: DBL_MAX), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: self], context: nil).size
    }
}
