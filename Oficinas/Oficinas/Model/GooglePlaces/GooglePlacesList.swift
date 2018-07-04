//
//  GooglePlacesList.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 03/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class GooglePlacesList: NSObject, ListControl
{
    var nextPageToken: String
    var status: String
    var list: [GooglePlaces]
    
    override init()
    {
        nextPageToken = ""
        status = ""
        list = [GooglePlaces]()
    }
    
    required convenience init(dataJSON: JSON)
    {
        self.init()
        nextPageToken = dataJSON["next_page_token"].stringValue
        status = dataJSON["status"].stringValue
        parseJSON(arrayJson: dataJSON["results"].arrayValue)
    }
    
    func parseJSON(arrayJson: [JSON])
    {
        for element in arrayJson
        {
            let googlePlace = GooglePlaces(dataJSON: element)
            list.append(googlePlace)
        }
    }
}
