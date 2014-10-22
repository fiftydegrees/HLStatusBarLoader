//
//  DetailViewController.swift
//  HLStatusBarLoaderExample
//
//  Created by Hervé Heurtault de Lammerville on 22/10/14.
//  Copyright (c) 2014 Hervé Heurtault de Lammerville. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "Detailed view"
        
        self.statusBarHUDForegroundColor = UIColor.whiteColor()
        
        self.showStatusBarHUD()
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        self.hideStatusBarHUD()
    }
}
