//
//  HLStatusBarLoader.swift
//  HLStatusBarLoaderExample
//
//  Created by Hervé Heurtault de Lammerville on 21/10/14.
//  Copyright (c) 2014 Hervé Heurtault de Lammerville. All rights reserved.
//

import Foundation
import UIKit

private var xoForegroundColorAssociationKey: UInt8 = 0

extension UIViewController {
    
    var foregroundColor: UIColor? {
        
        get {
            return objc_getAssociatedObject(self, &xoForegroundColorAssociationKey) as? UIColor
        }
        
        set (newColor) {
            objc_setAssociatedObject(self, &xoForegroundColorAssociationKey, newColor, UInt(OBJC_ASSOCIATION_RETAIN))
        }
    }
    
    func startLoading() -> Void {
        
        NSLog("Started loading")
    }
    
    func stopLoading() -> Void {
        
        NSLog("Stopped loading")
    }
}