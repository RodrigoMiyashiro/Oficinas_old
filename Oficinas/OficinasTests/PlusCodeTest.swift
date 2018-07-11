//
//  PlusCodeTest.swift
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

class PlusCodeTest: QuickSpec
{
    override func spec()
    {
        describe("PlusCode Model")
        {
            context("after class initialization (Simple)", {
                let plusCode = PlusCode()
                
                it("should not be nil", closure: {
                    expect(plusCode).notTo(beNil())
                })
            })
            
            context("after class initialization (JSON)", {
                let plusCode = PlusCode(dataJSON: ParseTest.parse(resouseString: "PlusCode")!)
                
                it("should not be nil", closure: {
                    expect(plusCode).notTo(beNil())
                })
            })
        }
    }
}
