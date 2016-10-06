//
//  OpenSansFont.swift
//  gotago
//
//  Created by Atin Amit on 6/10/16.
//  Copyright © 2016 Atin Amit. All rights reserved.
//

import UIKit

public struct OpenSansFont: SauceCodeFontType {
    // Size of font
    public static var pointSize: CGFloat {
        return SauceCodeFont.pointSize
    }
    
    // OpenSans Regular with size
    public static func regularWithSize(_ size: CGFloat) -> UIFont {
        SauceCodeFont.loadFontIfNeeded("OpenSans")
        if let f = UIFont(name: "OpenSans", size: size) {
            return f
        }
        return SauceCodeFont.systemFontWithSize(size)
    }
    
    // OpenSans regular font
    public static var regular: UIFont {
        return regularWithSize(SauceCodeFont.pointSize)
    }
    
    // OpenSans Light with size
    public static func lightWithSize(_ size: CGFloat) -> UIFont {
        SauceCodeFont.loadFontIfNeeded("OpenSans-Light")
        if let f = UIFont(name: "OpenSans-Light", size: size) {
            return f
        }
        return SauceCodeFont.systemFontWithSize(size)
    }
    
    // OpenSans Light font
    public static var light: UIFont {
        return lightWithSize(SauceCodeFont.pointSize)
    }
    
    // OpenSans Italic with size
    public static func italicWithSize(_ size: CGFloat) -> UIFont {
        SauceCodeFont.loadFontIfNeeded("OpenSans-Italic")
        if let f = UIFont(name: "OpenSans-Italic", size: size) {
            return f
        }
        return SauceCodeFont.systemFontWithSize(size)
    }
    
    // OpenSans Italic font
    public static var italic: UIFont {
        return italicWithSize(SauceCodeFont.pointSize)
    }
    
    // OpenSans Bold with size
    public static func boldWithSize(_ size: CGFloat) -> UIFont {
        SauceCodeFont.loadFontIfNeeded("OpenSans-Bold")
        if let f = UIFont(name: "OpenSans-Bold", size: size) {
            return f
        }
        return SauceCodeFont.systemFontWithSize(size)
    }
    
    // OpenSans Bold font
    public static var bold: UIFont {
        return boldWithSize(SauceCodeFont.pointSize)
    }
    
    // OpenSans Semi Bold with size
    public static func semiBoldWithSize(_ size: CGFloat) -> UIFont {
        SauceCodeFont.loadFontIfNeeded("OpenSans-Semibold")
        if let f = UIFont(name: "OpenSans-Semibold", size: size) {
            return f
        }
        return SauceCodeFont.systemFontWithSize(size)
    }
    
    // OpenSans Semi Bold font
    public static var semibold: UIFont {
        return semiBoldWithSize(SauceCodeFont.pointSize)
    }
    
    // OpenSans Extra Bold with size
    public static func extraBoldWithSize(_ size: CGFloat) -> UIFont {
        SauceCodeFont.loadFontIfNeeded("OpenSans-ExtraBold")
        if let f = UIFont(name: "OpenSans-ExtraBold", size: size) {
            return f
        }
        return SauceCodeFont.systemFontWithSize(size)
    }
    
    // OpenSans Extra Bold font
    public static var extrabold: UIFont {
        return extraBoldWithSize(SauceCodeFont.pointSize)
    }
    
    // OpenSans Light Italic with size
    public static func lightItalicWithSize(_ size: CGFloat) -> UIFont {
        SauceCodeFont.loadFontIfNeeded("OpenSans-LightItalic")
        if let f = UIFont(name: "OpenSans-LightItalic", size: size) {
            return f
        }
        return SauceCodeFont.systemFontWithSize(size)
    }
    
    // OpenSans Light Italic font
    public static var lightitalic: UIFont {
        return lightItalicWithSize(SauceCodeFont.pointSize)
    }
    
    // OpenSans Bold Italic with size
    public static func boldItalicWithSize(_ size: CGFloat) -> UIFont {
        SauceCodeFont.loadFontIfNeeded("OpenSans-BoldItalic")
        if let f = UIFont(name: "OpenSans-BoldItalic", size: size) {
            return f
        }
        return SauceCodeFont.systemFontWithSize(size)
    }
    
    // OpenSans Bold Italic font
    public static var bolditalic: UIFont {
        return boldItalicWithSize(SauceCodeFont.pointSize)
    }
    
    // OpenSans Extra Bold Italic with size
    public static func extraBoldItalicWithSize(_ size: CGFloat) -> UIFont {
        SauceCodeFont.loadFontIfNeeded("OpenSans-ExtraBoldItalic")
        if let f = UIFont(name: "OpenSans-ExtraBoldItalic", size: size) {
            return f
        }
        return SauceCodeFont.systemFontWithSize(size)
    }
    
    // OpenSans Light font
    public static var extrabolditalic: UIFont {
        return extraBoldItalicWithSize(SauceCodeFont.pointSize)
    }
    
    // OpenSans Semi Bold Italic with size
    public static func semiBoldItalicWithSize(_ size: CGFloat) -> UIFont {
        SauceCodeFont.loadFontIfNeeded("OpenSans-SemiboldItalic")
        if let f = UIFont(name: "OpenSans-SemiboldItalic", size: size) {
            return f
        }
        return SauceCodeFont.systemFontWithSize(size)
    }
    
    // OpenSans Semi Bold Italic font
    public static var semibolditalic: UIFont {
        return semiBoldItalicWithSize(SauceCodeFont.pointSize)
    }
}
