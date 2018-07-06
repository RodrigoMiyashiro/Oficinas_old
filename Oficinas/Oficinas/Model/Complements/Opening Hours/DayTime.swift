//
//  DayTime.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 05/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class DayTime: NSObject
{
    var day: String
    var time: String
    
    override init()
    {
        day = ""
        time = ""
    }
    
    required init(dataJSON: JSON)
    {
        day = dataJSON["day"].stringValue
        time = dataJSON ["time"].stringValue
    }
}
