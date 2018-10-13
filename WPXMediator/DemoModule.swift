//
//  DemoModule.swift
//  WPXMediator
//
//  Created by 葬花桥 on 2018/10/13.
//  Copyright © 2018年 葬花桥. All rights reserved.
//

import UIKit
import Foundation

extension WPXMediator {
    var WPXMediatorViewControllerForDetail: UIViewController? {
        if let viewController = self.perform(target: "DemoTarget", action: "action") as? UIViewController {
            return viewController
        }
        
        return nil
    }

}
