//
//  WPXMediator.swift
//  WPXMediator
//
//  Created by 葬花桥 on 2018/10/13.
//  Copyright © 2018年 葬花桥. All rights reserved.
//

import Foundation

public protocol WPXMediatorTarget {
    init()
}

extension WPXMediatorTarget {
//    init() {
//        self = try! createInstance(of: Self.self) as! Self
//    }
}

public final class WPXMediator {
    static let shared = WPXMediator()
    
    public func perform(action url: URL, completion: ([String: Any]) -> Void) {
        
    }
    
    public func perform(target name: String, action: String, params: [String: Any]? = nil, isCache: Bool = false) -> Any? {
        if let cls = NSClassFromString("WPXMediator." + name), let targetType = cls.self as? WPXMediatorTarget.Type {

            let targetObject = targetType.init()
            let s = Selector(action)
            
            if let method = extractMethodFrom(owner: targetObject as AnyObject, selector: s) {
                return method(params)
            }
        }
        
        return nil
    }
    
    func extractMethodFrom(owner: AnyObject, selector: Selector) -> (([String: Any]?) -> AnyObject)? {
        let method: Method?
        if owner is AnyClass {
            method = class_getClassMethod(owner as? AnyClass, selector)
        } else {
            method = class_getInstanceMethod(type(of: owner), selector)
        }
        guard let methodunwrapped = method else {
            return nil
        }
        let implementation = method_getImplementation(methodunwrapped)
        typealias Function = @convention(c) (AnyObject, Selector, [String: Any]?) -> Unmanaged<AnyObject>
        let function = unsafeBitCast(implementation, to: Function.self)
        return { params in function(owner, selector, params).takeUnretainedValue() }
    }
    

}
