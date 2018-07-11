//
//  ListTypeTest.swift
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

class ListTypeTest: QuickSpec
{
    override func spec()
    {
        describe("ListType Model")
        {
            context("after class initialization (Simple)", {
                let listType = ListType()
                
                it("should not be nil", closure: {
                    expect(listType).notTo(beNil())
                })
            })
            
            context("after class initialization (JSON)", {
                let listType = ListType(dataJSON: [ParseTest.parse(resouseString: "Types")!])
                
                it("should not be nil", closure: {
                    expect(listType).notTo(beNil())
                })
            })
        }
    }
}
