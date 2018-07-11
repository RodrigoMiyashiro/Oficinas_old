//
//  GooglePlacesViewModel.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 03/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

protocol GooglePlacesViewModelProtocol: ListParamtersProtocol
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
    func request(withLatLng lat: String, _ lng: String, completion: @escaping (Error?) -> Void)
    {
        let url = GenerateURL.get(type: .googlePlaces, location: "\(lat),\(lng)", token: places?.nextPageToken)
        
        GooglePlaceManager.getPlaces(withURL: url) { (places, error) in
            if let places = places
            {
                if places.list.count == 0
                {
                    let error = NSError(domain: places.status, code: 404, userInfo: nil)
                    completion(error)
                }
                else if places.nextPageToken != ""
                {
                    self.places = places
                }
                else
                {
                    let oldList = self.places
                    oldList?.list += places.list
                    oldList?.nextPageToken = places.nextPageToken
                    self.places = oldList
                }
            }
            if let error = error as? Error
            {
                completion(error)
            }
        }
    }
}
