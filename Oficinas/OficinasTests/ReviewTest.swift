//
//  ReviewTest.swift
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

class ReviewTest: QuickSpec
{
    override func spec()
    {
        describe("Review Model")
        {
            context("after class initialization (Simple)", {
                let review = Review()
                
                it("should not be nil", closure: {
                    expect(review).notTo(beNil())
                })
            })
            
            context("after class initialization (JSON)", {
                let review = Review(dataJSON: ParseTest.parse(resouseString: "Review")!)
                
                it("should not be nil", closure: {
                    expect(review).notTo(beNil())
                })
            })
        }
    }
}
