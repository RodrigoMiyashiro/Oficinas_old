//
//  OpeningHours.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 04/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class OpeningHours: NSObject, ListControl
{
    var openNow: Bool
    var periods: ListPeriods
    var weekdayText: [String]
    
    override init()
    {
        openNow = false
        periods = ListPeriods()
        weekdayText = [String]()
    }
    
    required convenience init(dataJSON: JSON)
    {
        self.init()
        openNow = dataJSON["open_now"].boolValue
        periods = ListPeriods(dataJSON: dataJSON["periods"])
        parseJSON(arrayJson: dataJSON["weekday_text"].arrayValue)
    }
    
    func parseJSON(arrayJson: [JSON])
    {
        for element in arrayJson
        {
            weekdayText.append(element.stringValue)
        }
    }
}
