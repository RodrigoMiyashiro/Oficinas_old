//
//  ListReviewTest.swift
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

class ListReviewTest: QuickSpec
{
    override func spec()
    {
        describe("ListReview Model")
        {
            context("after class initialization (Simple)", {
                let listReview = ListReviews()
                
                it("should not be nil", closure: {
                    expect(listReview).notTo(beNil())
                })
            })
            
            context("after class initialization (JSON)", {
                let listReview = ListReviews(dataJSON: [ParseTest.parse(resouseString: "ListReviewTest")!])
                
                it("should not be nil", closure: {
                    expect(listReview).notTo(beNil())
                })
            })
        }
    }
}
