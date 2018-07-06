//
//  ListReviews.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 05/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListReviews: NSObject, ListControl
{
    var list: [Review]
    
    override init()
    {
        list = [Review]()
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
            let review = Review(dataJSON: element)
            list.append(review)
        }
    }
}
