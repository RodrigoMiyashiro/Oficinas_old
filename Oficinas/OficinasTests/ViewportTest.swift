//
//  ViewportTest.swift
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

class ViewportTest: QuickSpec
{
    override func spec()
    {
        describe("Viewport Model")
        {
            context("after class initialization (Simple)", {
                let viewport = Viewport()
                
                it("should not be nil", closure: {
                    expect(viewport).notTo(beNil())
                })
            })
            
            context("after class initialization (JSON)", {
                let viewport = Viewport(dataJSON: ParseTest.parse(resouseString: "Viewport")!)
                
                it("should not be nil", closure: {
                    expect(viewport).notTo(beNil())
                })
            })
        }
    }
}
