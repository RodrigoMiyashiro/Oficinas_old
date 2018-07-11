//
//  Photo.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 04/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class Photo: NSObject, ListControl
{
    var photoReference: String
    var height: Int
    var width: Int
    var htmlAttributions: [String]
    
    override init()
    {
        photoReference = ""
        height = 0
        width = 0
        htmlAttributions = [String]()
    }
    
    required convenience init(dataJSON: JSON)
    {
        self.init()
        photoReference = dataJSON["photo_reference"].stringValue
        height = dataJSON["height"].intValue
        width = dataJSON["width"].intValue
        parseJSON(arrayJson: dataJSON["html_attributions"].arrayValue)
    }
    
    func parseJSON(arrayJson: [JSON])
    {
        for element in arrayJson
        {
            let newString = element.stringValue
            htmlAttributions.append(newString)
        }
    }
}
