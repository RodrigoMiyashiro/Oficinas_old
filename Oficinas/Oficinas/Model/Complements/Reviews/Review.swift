//
//  Reviews.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 05/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class Review: NSObject
{
    var authorName: String
    var authorURL: String
    var language: String
    var profilePhotoURL: String
    var rating: Double
    var relativeTimeDescription: String
    var text: String
    
    override init()
    {
        authorName = ""
        authorURL = ""
        language = ""
        profilePhotoURL = ""
        rating = 0
        relativeTimeDescription = ""
        text = ""
    }
    
    required init(dataJSON: JSON)
    {
        authorName = dataJSON["author_name"].stringValue
        authorURL = dataJSON["author_url"].stringValue
        language = dataJSON["language"].stringValue
        profilePhotoURL = dataJSON["profile_photo_url"].stringValue
        rating = dataJSON["rating"].doubleValue
        relativeTimeDescription = dataJSON["relative_time_description"].stringValue
        text = dataJSON["text"].stringValue
    }
}

