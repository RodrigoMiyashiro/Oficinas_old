//
//  GooglePlacesViewModel.swift
//  OficinasTests
//
//  Created by Rodrigo Miyashiro on 03/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import XCTest
import Quick
import Nimble

@testable import Oficinas

class GooglePlacesViewModelTest: QuickSpec
{
    override func spec()
    {
        describe("GooglePlaces Model")
        {
            context("after class initialization (Simple)", {
                let googlePlacesViewModel = GooglePlacesViewModel()
                
                it("should not be nil", closure: {
                    expect(googlePlacesViewModel).notTo(beNil())
                })
                
                it("should be a GooglePlacesList", closure: {
                    expect(googlePlacesViewModel.places).to(beAKindOf(GooglePlacesList.self))
                })
                
                it("should not be nil to GooglePlacesList")
                {
                    expect(googlePlacesViewModel.places).notTo(beNil())
                }
                
                it("should be equal to 0 to numberOfRows")
                {
                    expect(googlePlacesViewModel.numberOfRows()).to(be(0))
                }
                
                
                it("should be nil to placesDidChanged")
                {
                    expect(googlePlacesViewModel.placesDidChanged).to(beNil())
                }
                
                it("should not be nil to places")
                {
                    DispatchQueue.main.async {
                        googlePlacesViewModel.places = GooglePlacesList()
                    }
                    expect(googlePlacesViewModel.places).toEventuallyNot(beNil())
                }
                
                it("should not be nil after request")
                {
                    googlePlacesViewModel.request(withLatLng: "", "", completion: { (error) in
                        expect(error).to(beAKindOf(Error.self))
                    })
                    
                    expect(googlePlacesViewModel.places).toEventuallyNot(beNil())
                }
            })
            
            context("after class initialization (Complete)", {
                let googlePlacesViewModel = GooglePlacesViewModel()
                
                it("should not be nil", closure: {
                    expect(googlePlacesViewModel).notTo(beNil())
                })
                
                it("should be a GooglePlacesList", closure: {
                    expect(googlePlacesViewModel.places).to(beAKindOf(GooglePlacesList.self))
                })
                
                it("should not be nil to GooglePlacesList")
                {
                    expect(googlePlacesViewModel.places).notTo(beNil())
                }
                
                it("should be greater than 0 to numberOfRows")
                {
                    expect(googlePlacesViewModel.numberOfRows()).to(be(0))
                }
                
                
                it("should be nil to placesDidChanged")
                {
                    expect(googlePlacesViewModel.placesDidChanged).to(beNil())
                }
                
                it("should not be nil to places")
                {
                    DispatchQueue.main.async {
                        googlePlacesViewModel.places = GooglePlacesList()
                    }
                    expect(googlePlacesViewModel.places).toEventuallyNot(beNil())
                }
                
                it("should not be nil after request")
                {
                    DispatchQueue.main.async {
                        googlePlacesViewModel.request(withLatLng: "-23.580245", "-46.638548", completion: { (error) in
                            fatalError()
                        })
                    }
                    
                    expect(googlePlacesViewModel.numberOfRows()).toEventuallyNot(beNil())
                }
                it("should 123")
                {
                    DispatchQueue.main.async {
                        googlePlacesViewModel.request(withLatLng: "", "", completion: { (error) in
                            expect(error).to(beAKindOf(Error.self))
                        })
                    }
                    
                    expect(googlePlacesViewModel.numberOfRows()).toEventuallyNot(beNil())
                }
            })
        }
    }
}
