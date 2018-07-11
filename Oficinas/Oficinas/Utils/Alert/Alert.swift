//
//  Alert.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 03/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class Alert: NSObject
{
    static func show(title: String? = nil, message: String?, isSuccess: Bool? = nil) -> UIAlertController
    {
        let alert = UIAlertController(title: title ?? "Desculpe..." , message: (message), preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        
        return alert
    }
    
    static func show(title: String? = nil, message: String?, completion: @escaping (Bool) -> Void) -> UIAlertController
    {
        let alert = UIAlertController(title: title ?? "Desculpe..." , message: (message), preferredStyle: UIAlertControllerStyle.alert)
        
        
        alert.addAction(UIAlertAction(title: "Sim", style: UIAlertActionStyle.default, handler: { _ in
            completion(true)
        }))
        
        alert.addAction(UIAlertAction(title: "Não", style: UIAlertActionStyle.cancel, handler: { _ in
            completion(false)
        }))
        
        return alert
    }
}
