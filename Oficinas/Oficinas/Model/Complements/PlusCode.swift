//
//  PlusCode.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 04/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class PlusCode: NSObject
{
    var compoundCode: String
    var globalCode: String
    
    override init()
    {
        compoundCode = ""
        globalCode = ""
    }
    
    required init(dataJSON: JSON)
    {
        compoundCode = dataJSON["compound_code"].stringValue
        globalCode = dataJSON["global_code"].stringValue
    }
}
