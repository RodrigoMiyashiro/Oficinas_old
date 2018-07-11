//
//  PhotoTest.swift
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

class PhotoTest: QuickSpec
{
    override func spec()
    {
        describe("Photo Model")
        {
            context("after class initialization (Simple)", {
                let photo = Photo()
                
                it("should not be nil", closure: {
                    expect(photo).notTo(beNil())
                })
            })
            
            context("after class initialization (JSON)", {
                let photo = Photo(dataJSON: ParseTest.parse(resouseString: "Photo")!)
                
                it("should not be nil", closure: {
                    expect(photo).notTo(beNil())
                })
            })
        }
    }
}
