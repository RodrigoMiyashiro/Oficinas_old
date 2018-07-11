//
//  OpeningHoursTest.swift
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

class OpeningHoursTest: QuickSpec
{
    override func spec()
    {
        describe("OpeningHours Model")
        {
            context("after class initialization (Simple)", {
                let openingHours = OpeningHours()
                
                it("should not be nil", closure: {
                    expect(openingHours).notTo(beNil())
                })
            })
            
            context("after class initialization (JSON)", {
                let openingHours = OpeningHours(dataJSON: ParseTest.parse(resouseString: "OpeningHoursTest")!)
                
                it("should not be nil", closure: {
                    expect(openingHours).notTo(beNil())
                })
            })
        }
    }
}
