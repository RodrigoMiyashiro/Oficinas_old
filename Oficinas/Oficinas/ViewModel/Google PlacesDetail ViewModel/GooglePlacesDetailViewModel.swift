//
//  GooglePlacesDetailViewModel.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 06/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

protocol GooglePlacesDetailViewModelProtocol: SingleElementWithParameter
{
    var detailPlace: DetailPlace? { get }
    var detailPlaceDidChange: ((GooglePlacesDetailViewModelProtocol) -> Void)? { get set }
}

class GooglePlacesDetailViewModel: GooglePlacesDetailViewModelProtocol
{
    var detailPlace: DetailPlace?
    {
        didSet
        {
            self.detailPlaceDidChange?(self)
        }
    }
    
    var detailPlaceDidChange: ((GooglePlacesDetailViewModelProtocol) -> Void)?
    
    required init()
    {
        detailPlace = DetailPlace()
    }
}

extension GooglePlacesDetailViewModel
{
    func request(withURL url: String, completion: @escaping (Error?) -> Void)
    {
        GooglePlaceManager.getPlaceDetail(withURL: url) { (place, error) in
            if let place = place
            {
                self.detailPlace = place
            }
            if let error = error as? Error
            {
                completion(error)
            }
        }
    }
}
