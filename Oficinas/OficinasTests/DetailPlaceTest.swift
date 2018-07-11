//
//  DetailPlaceTest.swift
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

class DetailPlaceTest: QuickSpec
{
    override func spec()
    {
        describe("DetailPlace Model")
        {
            context("after class initialization (Simple)", {
                let detailPlace = DetailPlace()
                
                it("should not be nil", closure: {
                    expect(detailPlace).notTo(beNil())
                })
            })
            
            context("after class initialization (JSON)", {
                let detailPlace = DetailPlace(dataJSON: ParseTest.parse(resouseString: "GooglePlaceDetailTest")!)
                
                it("should not be nil", closure: {
                    expect(detailPlace).notTo(beNil())
                })
            })
        }
    }
}
