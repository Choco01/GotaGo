//
//  SauceCodeDevice.swift
//  gotago
//
//  Created by Atin Amit on 6/22/16.
//  Copyright © 2016 Atin Amit. All rights reserved.
//

import UIKit

public enum DeviceType {
    case iPad
    case iPhone
    case tv
    case unspecified
}

public struct SauceCodeDevice {
    /// Gets the model name for the device.
    public static var model: String {
        var systemInfo: utsname = utsname()
        uname(&systemInfo)
        
        let machineMirror: Mirror = Mirror(reflecting: systemInfo.machine)
        let identifier: String = machineMirror.children.reduce("") { (identifier, element) in
            guard let value = element.value as? Int8 , value != 0 else {
                return identifier
            }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":										return "iPod Touch 5"
        case "iPod7,1":										return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":			return "iPhone 4"
        case "iPhone4,1":									return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":						return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":						return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":						return "iPhone 5s"
        case "iPhone7,2":									return "iPhone 6"
        case "iPhone7,1":									return "iPhone 6 Plus"
        case "iPhone8,1":									return "iPhone 6s"
        case "iPhone8,2":									return "iPhone 6s Plus"
        case "iPhone8,4":									return "iPhone SE"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":	return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":				return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":				return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":				return "iPad Air"
        case "iPad5,3", "iPad5,4":							return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":				return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":				return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":				return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":							return "iPad Mini 4"
        case "iPad6,3", "iPad6,4":							return "iPad Pro 9.7-inch"
        case "iPad6,7", "iPad6,8":							return "iPad Pro 12.9-inch"
        case "AppleTV5,3":									return "Apple TV"
        case "i386", "x86_64":								return "Simulator"
        default:											return identifier
        }
    }
    
    /// Retrieves the current device type.
    public static var type: DeviceType {
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            return .iPad
        case .phone:
            return .iPhone
        case .tv:
            return .tv
        default:
            return .unspecified
        }
    }
    
    /// A Boolean indicating if the device is in Landscape mode.
    public static var isLandscape: Bool {
        return UIApplication.shared.statusBarOrientation.isLandscape
    }
    
    /// A Boolean indicating if the device is in Portrait mode.
    public static var isPortrait: Bool {
        return !SauceCodeDevice.isLandscape
    }
    
    /// The current UIInterfaceOrientation value.
    public static var orientation: UIInterfaceOrientation {
        return UIApplication.shared.statusBarOrientation
    }
    
    /// Retrieves the device status bar style.
    public static var statusBarStyle: UIStatusBarStyle {
        get {
            return UIApplication.shared.statusBarStyle
        }
        set(value) {
            UIApplication.shared.statusBarStyle = value
        }
    }
    
    /// Retrieves the device status bar hidden state.
    public static var statusBarHidden: Bool {
        get {
            return UIApplication.shared.isStatusBarHidden
        }
        set(value) {
            UIApplication.shared.isStatusBarHidden = value
        }
    }
    
    /// Retrieves the device bounds.
    public static var bounds: CGRect {
        return UIScreen.main.bounds
    }
    
    /// Retrieves the device width.
    public static var width: CGFloat {
        return bounds.width
    }
    
    /// Retrieves the device height.
    public static var height: CGFloat {
        return bounds.height
    }
    
    /// Retrieves the device scale.
    public static var scale: CGFloat {
        return UIScreen.main.scale
    }
}

