//
//  ListType.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 04/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListType: NSObject, ListControl
{
    var types: [String]
    
    override init()
    {
        types = [String]()
    }
    
    required convenience init(dataJSON: [JSON])
    {
        self.init()
        parseJSON(arrayJson: dataJSON)
    }
    
    func parseJSON(arrayJson: [JSON])
    {
        for element in arrayJson
        {
            let newString = element.stringValue
            types.append(newString)
        }
    }
}
