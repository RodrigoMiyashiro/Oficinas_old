//
//  GeometryTest.swift
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

class GeometryTest: QuickSpec
{
    override func spec()
    {
        describe("Geometry Model")
        {
            context("after class initialization (Simple)", {
                let geometry = Geometry()
                
                it("should not be nil", closure: {
                    expect(geometry).notTo(beNil())
                })
            })
            
            context("after class initialization (JSON)", {
                let geometry = Geometry(dataJSON: ParseTest.parse(resouseString: "Geometry")!)
                
                it("should not be nil", closure: {
                    expect(geometry).notTo(beNil())
                })
            })
        }
    }
}
