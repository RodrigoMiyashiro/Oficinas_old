//
//  ListPhoto.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 04/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListPhotos: NSObject, ListControl
{
    var photos: [Photo]
    
    override init()
    {
        photos = [Photo]()
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
            let photo = Photo(dataJSON: element)
            photos.append(photo)
        }
    }
}
