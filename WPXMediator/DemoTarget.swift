//
//  DemoTarget.swift
//  WPXMediator
//
//  Created by 葬花桥 on 2018/10/13.
//  Copyright © 2018年 葬花桥. All rights reserved.
//

import UIKit

final class DemoTarget: WPXMediatorTarget {
    var age = 10
    @objc dynamic var a: String {
        return ""
    }
    
    @objc dynamic func action() -> UIViewController {
        
        return UIViewController()
    }
}
