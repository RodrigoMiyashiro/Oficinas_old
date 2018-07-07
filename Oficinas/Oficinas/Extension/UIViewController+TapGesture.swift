//
//  UIViewController+TapGesture.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 07/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SafariServices

class CustomUITapGestureRecognizer: UITapGestureRecognizer
{
    var string = String()
}

extension UIViewController: SFSafariViewControllerDelegate
{
    func configGestureView(view: UIView, destination: TypeDestination, value: String)
    {
        var gesture: CustomUITapGestureRecognizer?
        if destination == .safari
        {
           gesture = CustomUITapGestureRecognizer(target: self, action: #selector(openSafariVC))
        }
        else
        {
           gesture = CustomUITapGestureRecognizer(target: self, action: #selector(makeCall))
        }
        
        view.isUserInteractionEnabled = true
        gesture?.string = value
        view.addGestureRecognizer(gesture!)
    }
    
    @objc func openSafariVC(_ tapped: CustomUITapGestureRecognizer)
    {
        let urlString = tapped.string
        
        if let url = URL(string: urlString)
        {
            let vc = SFSafariViewController(url: url) //SFSafariViewController(url: url, entersReaderIfAvailable: true)
            vc.delegate = self
            present(vc, animated: true)
        }
    }
    
    @objc func makeCall(_ tapped: CustomUITapGestureRecognizer)
    {
        let numberClear = tapped.string.clearPhoneNumber
        
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
