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
private var xoBackgroundColorAssociationKey: UInt8 = 1

private var xoTimerAssociationKeyy: NSTimer        = NSTimer()

private let _LoaderHUDSharedInstance = LoaderHUD(frame: CGRectMake(0.0, -20.0, CGRectGetWidth(UIScreen.mainScreen().bounds), 2.0))

class LoaderHUD: UIView {
    
    var factoryTimer: NSTimer?
    
    var foregroundColor: UIColor?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        orientationDidChange(nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "orientationDidChange:", name: UIDeviceOrientationDidChangeNotification, object: nil)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    class var sharedInstance: LoaderHUD {
        return _LoaderHUDSharedInstance
    }
    
    func startLoadingAnimation(animated: Bool) -> Void {
        
        stopLoadingAnimation(false)
            
        UIView.animateWithDuration((animated ? 0.2 : 0.0), animations: { () -> Void in
            LoaderHUD.sharedInstance.alpha = 1.0
        })
        
        addSwipingView()
        factoryTimer = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: "addSwipingView", userInfo: nil, repeats: true)
    }
    
    func stopLoadingAnimation(animated: Bool) -> Void {
        
        factoryTimer?.invalidate()
        factoryTimer = nil
        
        UIView.animateWithDuration((animated ? 0.2 : 0.0), animations: { () -> Void in
            LoaderHUD.sharedInstance.alpha = 0.0
        })
    }
    
    func addSwipingView() {
        
        var loadingView: UIView         = UIView(frame: CGRectMake(CGRectGetWidth(LoaderHUD.sharedInstance.bounds), 0.0,
                                                                   50.0, CGRectGetHeight(LoaderHUD.sharedInstance.bounds)))
        loadingView.backgroundColor     = (foregroundColor != nil ? foregroundColor : UIColor.blackColor())
        
        LoaderHUD.sharedInstance.addSubview(loadingView)

        var animation: CABasicAnimation = CABasicAnimation()
        animation.duration              = 2.5
        animation.keyPath               = "position.x";
        animation.fromValue             = CGRectGetWidth(LoaderHUD.sharedInstance.bounds) + CGRectGetWidth(loadingView.frame)
        animation.toValue               = -CGRectGetWidth(LoaderHUD.sharedInstance.bounds)
        animation.timingFunction        = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        loadingView.layer.addAnimation(animation, forKey: "basic")
    }
    
    func orientationDidChange(notification: NSNotification?) {
        
        factoryTimer?.invalidate()
        factoryTimer = nil
        
        UIView.animateWithDuration(0.2,
            animations: { () -> Void in
                
                self.alpha = 0.0
        }) { (finished) -> Void in
            
            for view in self.subviews {
                view.removeFromSuperview()
            }
            
            var currentOrientation: UIInterfaceOrientation = UIApplication.sharedApplication().statusBarOrientation
            
            if UIInterfaceOrientationIsPortrait(currentOrientation) {
                self.frame = CGRectMake(0.0, -20.0, CGRectGetWidth(UIScreen.mainScreen().bounds), 2.0)
            }
            else if UIInterfaceOrientationIsLandscape(currentOrientation) {
                self.frame = CGRectMake(0.0, 0.0, CGRectGetWidth(UIScreen.mainScreen().bounds), 2.0)
            }
            
            self.startLoadingAnimation(true)
        }
        
    }
}

extension UIViewController {
    
    var statusBarHUDForegroundColor: UIColor? {
        
        get { return LoaderHUD.sharedInstance.foregroundColor }
        set (newColor) { LoaderHUD.sharedInstance.foregroundColor = newColor }
    }
    
    func showStatusBarHUD() -> Void {
        
        if LoaderHUD.sharedInstance.superview == nil {
            self.navigationController?.navigationBar.addSubview(LoaderHUD.sharedInstance)
        }
        
        LoaderHUD.sharedInstance.startLoadingAnimation(true)
    }
    
    func hideStatusBarHUD() -> Void {
        
        LoaderHUD.sharedInstance.stopLoadingAnimation(true)
    }
}