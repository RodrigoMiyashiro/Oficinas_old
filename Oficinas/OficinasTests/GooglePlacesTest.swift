//
//  GooglePlacesTest.swift
//  OficinasTests
//
//  Created by Rodrigo Miyashiro on 03/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import XCTest
import Quick
import Nimble
import SwiftyJSON

@testable import Oficinas

class GooglePlacesTest: QuickSpec
{
    override func spec()
    {
        describe("GooglePlace Model")
        {
            context("after class initialization (Simple)", {
                let googlePlace = GooglePlaces()
                
                it("should not be nil", closure: {
                    expect(googlePlace).notTo(beNil())
                })
            })
            
            context("after class initialization (JSON)", {
                let googlePlace = GooglePlaces(dataJSON: ParseTest.parse(resouseString: "GooglePlacesTest")!)
                
                it("should not be nil", closure: {
                    expect(googlePlace).notTo(beNil())
                })
            })
        }
    }
}
