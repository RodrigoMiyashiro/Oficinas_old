//
//  UIViewController+OpenURL.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 10/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension UIViewController
{
    func openSettingURL()
    {
        if let url = URL(string: UIApplicationOpenSettingsURLString)
        {
            UIApplication.shared.open(url)
        }
    }
}
