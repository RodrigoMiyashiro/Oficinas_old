//
//  DayTimeTest.swift
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

class DayTimeTest: QuickSpec
{
    override func spec()
    {
        describe("DayTime Model")
        {
            context("after class initialization (Simple)", {
                let dayTime = DayTime()
                
                it("should not be nil", closure: {
                    expect(dayTime).notTo(beNil())
                })
            })
            
            context("after class initialization (JSON)", {
                let dayTime = DayTime(dataJSON: ParseTest.parse(resouseString: "DayTimeTest")!)
                
                it("should not be nil", closure: {
                    expect(dayTime).notTo(beNil())
                })
            })
        }
    }
}
