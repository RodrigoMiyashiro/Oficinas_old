//
//  OpeningHours.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 04/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class OpeningHours: NSObject
{
    var openNow: Bool
    
    override init()
    {
        openNow = false
    }
    
    required init(dataJSON: JSON)
    {
        openNow = dataJSON["open_now"].boolValue
    }
}
