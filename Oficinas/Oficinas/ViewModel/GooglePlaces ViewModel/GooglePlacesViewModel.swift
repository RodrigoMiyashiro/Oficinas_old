//
//  GooglePlacesViewModel.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 03/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

protocol GooglePlacesViewModelProtocol: ListElementsProtocol
{
    var places: GooglePlacesList? { get }
    var placesDidChanged: ((GooglePlacesViewModelProtocol) -> Void)? { get set }
}

class GooglePlacesViewModel: GooglePlacesViewModelProtocol
{
    var places: GooglePlacesList?
    {
        didSet
        {
            self.placesDidChanged?(self)
        }
    }
    
    var placesDidChanged: ((GooglePlacesViewModelProtocol) -> Void)?
    
    required init()
    {
        places = GooglePlacesList()
    }
    
    func numberOfRows() -> Int
    {
        return places?.list.count ?? 0
    }
}

extension GooglePlacesViewModel
{
    func request(completion: @escaping (Error?) -> Void)
    {
        let url = GenerateURL.get(type: .googlePlaces, location: "-23.580245,-46.638548")
        
        GooglePlaceManager.getPlaces(withURL: url) { (places, error) in
            if let places = places
            {
                self.places = places
            }
            if let error = error as? Error
            {
                completion(error)
            }
        }
    }
}
