//
//  UIViewController.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 03/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension UIViewController
{
    func setNavigationType(_ navigationType: NavigationType, viewController: UIViewController)
    {
        switch navigationType
        {
        case .navigationController:
            navigationController?.pushViewController(viewController, animated: true)
            
        case .present:
            self.present(viewController, animated: true, completion: nil)
            
        case .presentFade:
            viewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            viewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            
            present(viewController, animated: true, completion: nil)
        }
    }
    
    
    // MARK: - Title
    func set(title: String)
    {
        self.title = title
    }

    
    // MARK: - Call
    func makeCall(number: String)
    {
        let numberClear = number.clearPhoneNumber
        
        if let url = URL(string: "tel://\(numberClear)"), UIApplication.shared.canOpenURL(url)
        {
            if #available(iOS 10, *)
            {
                UIApplication.shared.open(url)
            }
            else
            {
                UIApplication.shared.openURL(url)
            }
        }
    }
}
