//
//  UIImage+Kingfisher.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 04/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView
{
    func download(image url: String, placeholder: String)
    {
        let imgPlaceholder = UIImage(named: placeholder)
        
        guard let imgURL = URL(string: url) else {
            self.image = imgPlaceholder
            return
        }
        self.kf.indicatorType = .activity
        self.kf.indicator?.startAnimatingView()
        self.kf.setImage(with: ImageResource(downloadURL: imgURL), placeholder: imgPlaceholder)
        self.kf.indicator?.stopAnimatingView()
    }
}
