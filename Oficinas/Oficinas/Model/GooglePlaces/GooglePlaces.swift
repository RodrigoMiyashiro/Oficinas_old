//
//  GooglePlaces.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 03/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class GooglePlaces: NSObject
{
    var id: String
    var icon: String
    var name: String
    var placeID: String
    var rating: Double
    var reference: String
    var scope: String
    var vicinity: String
    var openingHours: OpeningHours
    var geometry: Geometry
    var photos: ListPhotos
    var plusCode: PlusCode
    var types: ListType
    
    override init()
    {
        id = ""
        icon = ""
        name = ""
        placeID = ""
        rating = 0
        reference = ""
        scope = ""
        vicinity = ""
        openingHours = OpeningHours()
        geometry = Geometry()
        photos = ListPhotos()
        plusCode = PlusCode()
        types = ListType()
    }
    
    required init(dataJSON: JSON)
    {
        id = dataJSON["id"].stringValue
        icon = dataJSON["icon"].stringValue
        name = dataJSON["name"].stringValue
        placeID = dataJSON["place_id"].stringValue
        rating = dataJSON["rating"].doubleValue
        reference = dataJSON["reference"].stringValue
        scope = dataJSON["scope"].stringValue
        vicinity = dataJSON["vicinity"].stringValue
        openingHours = OpeningHours(dataJSON: dataJSON["opening_hours"])
        geometry = Geometry(dataJSON: dataJSON["geometry"])
        photos = ListPhotos(dataJSON: dataJSON["photos"].arrayValue)
        plusCode = PlusCode(dataJSON: dataJSON["plus_code"])
        types = ListType(dataJSON: dataJSON["types"].arrayValue)
    }
}
