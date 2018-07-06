//
//  DetailPlace.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 05/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class DetailPlace: NSObject
{
    var id: String
    var formattedAddress: String
    var formattedPhoneNumber: String
    var name: String
    var openingHours: OpeningHours
    var photos: ListPhotos
    var placeID: String
    var rating: Double
    var reference: String
    var website: String
    var reviews: ListReviews
    var geometry: Geometry
    
    override init()
    {
        id = ""
        formattedAddress = ""
        formattedPhoneNumber = ""
        name = ""
        openingHours = OpeningHours()
        photos = ListPhotos()
        placeID = ""
        rating = 0
        reference = ""
        website = ""
        reviews = ListReviews()
        geometry = Geometry()
    }
    
    required init(dataJSON: JSON)
    {
        id = dataJSON["result"]["id"].stringValue
        formattedAddress = dataJSON["result"]["formatted_address"].stringValue
        formattedPhoneNumber = dataJSON["result"]["formatted_phone_number"].stringValue
        name = dataJSON["result"]["name"].stringValue
        openingHours = OpeningHours(dataJSON: dataJSON["result"]["opening_hours"])
        photos = ListPhotos(dataJSON: dataJSON["result"]["photos"].arrayValue)
        placeID = dataJSON["result"]["place_id"].stringValue
        rating = dataJSON["result"]["rating"].doubleValue
        reference = dataJSON["result"]["reference"].stringValue
        website = dataJSON["result"]["website"].stringValue
        reviews = ListReviews(dataJSON: dataJSON["result"]["reviews"].arrayValue)
        geometry = Geometry(dataJSON: dataJSON["result"]["geometry"])
    }
}
