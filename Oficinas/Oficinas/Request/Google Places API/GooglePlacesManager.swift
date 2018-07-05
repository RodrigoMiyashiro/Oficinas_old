//
//  GooglePlacesManager.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 03/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class GooglePlaceManager: NSObject
{
    static func getPlaces(withURL url: String, completion: @escaping(GooglePlacesList?, Any?) -> Void)
    {
        Request.getFrom(url) { (result, error) in
            if let data = result as? Data
            {
                let places = GooglePlacesList(dataJSON: JSON(data))
                completion(places, nil)
            }
            else if let error = error
            {
                completion(nil, error)
            }
            else
            {
                completion(nil, ErrorManager.error(type: .unknown))
            }
        }
    }
}

