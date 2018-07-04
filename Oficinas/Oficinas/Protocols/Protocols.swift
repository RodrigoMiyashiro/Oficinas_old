//
//  Protocols.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 03/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol ListControl: class
{
    func parseJSON(arrayJson: [JSON])
}
