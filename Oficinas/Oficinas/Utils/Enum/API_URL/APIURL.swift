//
//  APIURL.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 03/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

// https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-23.580245, -46.638548&radius=500&types=car_repair&key=AIzaSyDSS3vIvjawcqcFa-0rH_PXTg8UstDV1sE
enum BaseURL: String
{
    case url = "https://maps.googleapis.com"
}

enum ExtensionURL: String
{
    case maps = "/maps"
    case api = "/api"
    case place = "/place"
    case nearbysearch = "/nearbysearch"
    case json = "/json"
    case photo = "/photo"
    
    case bar = "/"
    case questionMark = "?"
    case concat = "&"
}

enum ParameterURL: String
{
    case location = "location="
    case radius = "radius="
    case types = "types="
    case key = "key="
    case maxwidth = "maxwidth="
    case photoreference = "photoreference="
}


enum TypeURL: String
{
    case googlePlaces
    case photo
}

enum RadiusSearch: String
{
    case halfAKilometer = "500"
}

enum PhotoSize: String
{
    case fourHundred = "400"
}

enum TypeSearchPlace: String
{
    case carRepair = "car_repair"
}
