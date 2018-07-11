//
//  GooglePlacesListTest.swift
//  OficinasTests
//
//  Created by Rodrigo Miyashiro on 03/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import XCTest
import Quick
import Nimble
import SwiftyJSON

@testable import Oficinas

class GooglePlacesListTest: QuickSpec
{
    override func spec()
    {
        describe("GooglePlacesList Model")
        {
            context("after class initialization (Simple)", {
                let listGooglePlace = GooglePlacesList()
                
                it("should not be nil", closure: {
                    expect(listGooglePlace).notTo(beNil())
                })
            })
            
            context("after class initialization (JSON)", {
                let listGooglePlace = GooglePlacesList(dataJSON: ParseTest.parse(resouseString: "ListGooglePlacesTest")!)
                
                it("should not be nil", closure: {
                    expect(listGooglePlace).notTo(beNil())
                })
            })
        }
    }
}
