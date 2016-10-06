//
//  SauceCodeFont.swift
//  gotago
//
//  Created by Atin Amit on 6/10/16.
//  Copyright © 2016 Atin Amit. All rights reserved.
//

import UIKit

public protocol SauceCodeFontType {}

public struct SauceCodeFont : SauceCodeFontType {
    
    // Size of font
    public static let pointSize: CGFloat = 16
    
    // Retrieves the system font with specified size
    public static func systemFontWithSize(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }
    
    // Retrieve the bold system font with specified size
    public static func boldSystemFontWithSize(_ size: CGFloat) -> UIFont {
        return UIFont.boldSystemFont(ofSize: size)
    }
    
    // Retireve the italic system font of specific size
    public static func italicSystemFontWithSize(_ size: CGFloat) -> UIFont {
        return UIFont.italicSystemFont(ofSize: size)
    }
    
    // Load a font if needed
    public static func loadFontIfNeeded(_ fontName: String) {
        SauceCodeFontLoader.loadFontIfNeeded(fontName)
    }
}

// Load SauceCode Font Package
private class SauceCodeFontLoader {
    // Dictionary of fonts already loaded
    static var loadedFonts: Dictionary<String, String> = Dictionary<String, String>()
    
    // Load a font specified if needed
    static func loadFontIfNeeded(_ fontName: String) {
        let loadedFont: String? = SauceCodeFontLoader.loadedFonts[fontName]
        
        if nil == loadedFont && nil == UIFont(name: fontName, size: 1) {
            SauceCodeFontLoader.loadedFonts[fontName] = fontName
            
            let bundle: Bundle = Bundle(for: SauceCodeFontLoader.self)
//            let identifier: String? = bundle.bundleIdentifier
            
            let fontURL: URL? = bundle.url(forResource: fontName, withExtension: "ttf")
            
            if let v: URL = fontURL {
                let data: Data = try! Data(contentsOf: v)
                let provider: CGDataProvider = CGDataProvider(data: data as CFData)!
                let font: CGFont = CGFont(provider)
                
//                NSLog("CGFontGetStemV(font) = \(CGFontGetStemV(font))")
                NSLog("CGFontCopyFullName(font) = \(font.fullName)")
                
                
                var error: Unmanaged<CFError>?
                if !CTFontManagerRegisterGraphicsFont(font, &error) {
                    let errorDescription: CFString = CFErrorCopyDescription(error!.takeUnretainedValue())
                    let nsError: NSError = error!.takeUnretainedValue() as AnyObject as! NSError
                    
                    NSException(name: NSExceptionName.internalInconsistencyException, reason: errorDescription as String, userInfo: [NSUnderlyingErrorKey: nsError]).raise()
                }
                
            }
        }
    }
}
