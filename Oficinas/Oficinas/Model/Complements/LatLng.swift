//
//  LatLng.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 04/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreLocation

class LatLng: NSObject
{
    var lat: CLLocationDegrees
    var lng: CLLocationDegrees
    
    override init()
    {
        lat = CLLocationDegrees()
        lng = CLLocationDegrees()
    }
    
    required init(dataJSON: JSON)
    {
        lat = CLLocationDegrees(dataJSON["lat"].doubleValue)
        lng = CLLocationDegrees(dataJSON["lat"].doubleValue)
    }
}
