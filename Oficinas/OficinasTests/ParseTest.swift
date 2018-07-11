//
//  Parse.swift
//  OficinasTests
//
//  Created by Rodrigo Miyashiro on 10/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class ParseTest: NSObject
{
    static func parse(resouseString: String) -> JSON?
    {
        if let path = Bundle.main.path(forResource: resouseString, ofType: "json")
        {
            do
            {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonData = try JSON(data: data)
                return jsonData
            }
            catch
            {
                
            }
        }
        return nil
    }
}
