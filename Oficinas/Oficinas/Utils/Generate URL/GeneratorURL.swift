//
//  GeneratorURL.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 03/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

class GenerateURL: NSObject
{
    static func get(type: TypeURL, location: String? = nil) -> String
    {
        var url: String
        
        switch type
        {
        case .googlePlaces:
            url = "\(BaseURL.url.rawValue)\(ExtensionURL.maps.rawValue)\(ExtensionURL.api.rawValue)\(ExtensionURL.place.rawValue)\(ExtensionURL.nearbysearch.rawValue)\(ExtensionURL.json.rawValue)\(ExtensionURL.questionMark.rawValue)\(ParameterURL.location.rawValue)\(location ?? "")\(ExtensionURL.concat.rawValue)\(ParameterURL.radius.rawValue)\(RadiusSearch.halfAKilometer.rawValue)\(ExtensionURL.concat.rawValue)\(ParameterURL.types.rawValue)\(TypeSearchPlace.carRepair.rawValue)\(ExtensionURL.concat.rawValue)\(ParameterURL.key.rawValue)\(APIKey.googlePlacesKey.rawValue)"
   
        case .photo:
            url = "\(BaseURL.url.rawValue)\(ExtensionURL.maps.rawValue)\(ExtensionURL.api.rawValue)\(ExtensionURL.place.rawValue)\(ExtensionURL.photo.rawValue)\(ExtensionURL.questionMark.rawValue)\(ParameterURL.maxwidth.rawValue)\(PhotoSize.fourHundred.rawValue)\(ExtensionURL.concat.rawValue)\(ParameterURL.photoreference.rawValue)\(location ?? "")\(ExtensionURL.concat.rawValue)\(ParameterURL.key.rawValue)\(APIKey.googlePlacesKey.rawValue)"
        }
        
        return url
    }
}

