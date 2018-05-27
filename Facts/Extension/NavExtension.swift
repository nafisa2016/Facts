//
//  NavExtension.swift
//  Facts
//
//  Created by Nafisa Rahman on 5/26/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    
    override open var supportedInterfaceOrientations : UIInterfaceOrientationMask     {
        
        return [.all]
    }
    
    override open func overrideTraitCollection(forChildViewController childViewController: UIViewController) -> UITraitCollection? {
        
        if UIDevice.current.userInterfaceIdiom == .pad && UIDevice.current.orientation.isLandscape {
            return UITraitCollection(traitsFrom:[UITraitCollection(verticalSizeClass: .compact), UITraitCollection(horizontalSizeClass: .regular)])
        }
        return super.overrideTraitCollection(forChildViewController: childViewController)
    }
}

