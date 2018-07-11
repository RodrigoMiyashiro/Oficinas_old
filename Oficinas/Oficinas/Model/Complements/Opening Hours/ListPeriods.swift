//
//  ListPeriods.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 05/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListPeriods: NSObject, ListControl
{
    var array: [Period]
    
    override init()
    {
        array = [Period]()
    }
    
    required convenience init(dataJSON: JSON)
    {
        self.init()
        parseJSON(arrayJson: dataJSON.arrayValue)
    }
    
    func parseJSON(arrayJson: [JSON])
    {
        for element in arrayJson
        {
            let newDayTime = Period(dataJSON: element)
            array.append(newDayTime)
        }
    }
}
