//
//  String.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 06/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

extension String
{
    var clearPhoneNumber: String
    {
        return self.replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "").replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-", with: "")
    }
}
