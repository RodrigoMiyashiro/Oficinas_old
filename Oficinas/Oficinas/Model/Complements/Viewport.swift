//
//  Viewport.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 04/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class Viewport: NSObject
{
    var northeast: LatLng
    var southwest: LatLng
    
    override init()
    {
        northeast = LatLng()
        southwest = LatLng()
    }
    
    required init(dataJSON: JSON)
    {
        northeast = LatLng(dataJSON: dataJSON["northeast"])
        southwest = LatLng(dataJSON: dataJSON["southwest"])
    }
}
