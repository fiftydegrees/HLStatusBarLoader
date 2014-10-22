//
//  HLStatusBarLoader.swift
//  HLStatusBarLoaderExample
//
//  Created by Hervé Heurtault de Lammerville on 21/10/14.
//  Copyright (c) 2014 Hervé Heurtault de Lammerville. All rights reserved.
//

import Foundation
import UIKit

private var xoForegroundColorAssociationKey: UInt8    = 0
private var xoBackgroundColorAssociationKey: UInt8    = 1

private var xoTimerAssociationKeyy: NSTimer    = NSTimer()

extension UIViewController {
    
    var loaderForegroundColor: UIColor? {
        
        get {
            
            var color: UIColor? = objc_getAssociatedObject(self, &xoForegroundColorAssociationKey) as UIColor?
            
            if color != nil {
                return color
            }
            else {
                return UIColor.blackColor()
            }
        }
        
        set (newColor) { objc_setAssociatedObject(self, &xoForegroundColorAssociationKey, newColor, UInt(OBJC_ASSOCIATION_RETAIN)) }
    }
    
    private var factoryTimer: NSTimer? {
        get { return objc_getAssociatedObject(self, &xoTimerAssociationKeyy) as? NSTimer }
        set (newTimer) {
            objc_setAssociatedObject(self, &xoTimerAssociationKeyy, newTimer, UInt(OBJC_ASSOCIATION_RETAIN)) }
    }
    
    func startLoading() -> Void {
        
        stopLoading()
        
        generateView()
        factoryTimer = NSTimer.scheduledTimerWithTimeInterval(0.8, target: self, selector: "generateView", userInfo: nil, repeats: true)
    }
    
    func stopLoading() -> Void {
        
        var timer: NSTimer? = factoryTimer
        
        self.factoryTimer?.invalidate()
        self.factoryTimer = nil
    }
    
    func generateView() {
        
        var loadingView: UIView = UIView(frame: CGRectMake(CGRectGetWidth(UIScreen.mainScreen().bounds), -20.0,
            CGRectGetWidth(UIScreen.mainScreen().bounds) / 4.0, 2.0))
        loadingView.backgroundColor = loaderForegroundColor
        self.navigationController?.navigationBar.addSubview(loadingView)
        self.navigationController?.navigationBar.bringSubviewToFront(loadingView)
        
        var animation: CABasicAnimation = CABasicAnimation()
        animation.duration = 2.0
        animation.keyPath = "position.x";
        animation.fromValue = CGRectGetWidth(UIScreen.mainScreen().bounds) + CGRectGetWidth(loadingView.frame)
        animation.toValue = -CGRectGetWidth(loadingView.frame)
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        loadingView.layer.addAnimation(animation, forKey: "basic")
    }
}