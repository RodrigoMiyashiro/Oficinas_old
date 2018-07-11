//
//  LatLngTest.swift
//  OficinasTests
//
//  Created by Rodrigo Miyashiro on 09/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import XCTest
import Quick
import Nimble
import SwiftyJSON

@testable import Oficinas

class LatLngTest: QuickSpec
{
    override func spec()
    {
        describe("LatLng Model")
        {
            context("after class initialization (Simple)", {
                let latLng = LatLng()
                
                it("should not be nil", closure: {
                    expect(latLng).notTo(beNil())
                })
            })
            
            context("after class initialization (JSON)", {
                let latLng = LatLng(dataJSON: ParseTest.parse(resouseString: "LatLng")!)
                
                it("should not be nil", closure: {
                    expect(latLng).notTo(beNil())
                })
            })
        }
    }
}
