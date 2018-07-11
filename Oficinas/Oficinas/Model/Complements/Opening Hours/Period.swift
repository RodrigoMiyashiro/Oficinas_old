//
//  Period.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 05/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class Period: NSObject
{
    var open: DayTime
    var close: DayTime
    
    override init()
    {
        open = DayTime()
        close = DayTime()
    }
    
    required init(dataJSON: JSON)
    {
        open = DayTime(dataJSON: dataJSON["open"])
        close = DayTime(dataJSON: dataJSON["close"])
    }
}


