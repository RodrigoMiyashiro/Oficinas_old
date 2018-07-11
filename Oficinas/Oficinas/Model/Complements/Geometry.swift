//
//  Geometry.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 04/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class Geometry: NSObject
{
    var location: LatLng
    var viewport: Viewport
    
    override init()
    {
        location = LatLng()
        viewport = Viewport()
    }
    
    required init(dataJSON: JSON)
    {
        location = LatLng(dataJSON: dataJSON["location"])
        viewport = Viewport(dataJSON: dataJSON["viewport"])
    }
}
