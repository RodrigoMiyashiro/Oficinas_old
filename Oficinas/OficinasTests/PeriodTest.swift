//
//  PeriodTest.swift
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

class PeriodTest: QuickSpec
{
    override func spec()
    {
        describe("Period Model")
        {
            context("after class initialization (Simple)", {
                let period = Period()
                
                it("should not be nil", closure: {
                    expect(period).notTo(beNil())
                })
            })
            
            context("after class initialization (JSON)", {
                let period = Period(dataJSON: ParseTest.parse(resouseString: "PeriodTest")!)
                
                it("should not be nil", closure: {
                    expect(period).notTo(beNil())
                })
            })
        }
    }
}
