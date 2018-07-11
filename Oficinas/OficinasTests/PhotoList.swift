//
//  PhotoList.swift
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

class PhotoList: QuickSpec
{
    override func spec()
    {
        describe("PhotoList Model")
        {
            context("after class initialization (Simple)", {
                let photos = ListPhotos()
                
                it("should not be nil", closure: {
                    expect(photos).notTo(beNil())
                })
            })
            
            context("after class initialization (JSON)", {
                let photos = ListPhotos(dataJSON: [ParseTest.parse(resouseString: "ListPhoto")!])
                
                it("should not be nil", closure: {
                    expect(photos).notTo(beNil())
                })
            })
        }
    }
}
