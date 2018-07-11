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

protocol InitializerProtocol: class
{
    init()
}

protocol Countable: class
{
    func numberOfRows() -> Int
}

protocol RequestElement: class
{
    func request(completion: @escaping(Error?) -> Void)
}

protocol RequestElementURL: class
{
    func request(withURL url: String, completion: @escaping(Error?) -> Void)
}

protocol RequestElementWithLatLng: class
{
    func request(withLatLng lat: String, _ lng: String, completion: @escaping(Error?) -> Void)
}



protocol SingleElement: InitializerProtocol, RequestElement { }

protocol SingleElementWithParameter: InitializerProtocol, RequestElementURL { }

protocol ListElementsProtocol: InitializerProtocol, Countable, RequestElement { }

protocol ListParamURLProtocol: InitializerProtocol, Countable, RequestElementURL { }

protocol ListParamtersProtocol: InitializerProtocol, Countable, RequestElementWithLatLng { }
