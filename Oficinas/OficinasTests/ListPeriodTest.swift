//
//  ListPeriodTest.swift
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

class ListPeriodTest: QuickSpec
{
    override func spec()
    {
        describe("ListPeriod Model")
        {
            context("after class initialization (Simple)", {
                let listPeriod = ListPeriods()
                
                it("should not be nil", closure: {
                    expect(listPeriod).notTo(beNil())
                })
            })
            
            context("after class initialization (JSON)", {
                let listPeriod = ListPeriods(dataJSON: [ParseTest.parse(resouseString: "ListPeriodTest")!])
                
                it("should not be nil", closure: {
                    expect(listPeriod).notTo(beNil())
                })
            })
        }
    }
}
