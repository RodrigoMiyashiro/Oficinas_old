//
//  CarRepairListTableViewCell.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 05/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class CarRepairListTableViewCell: UITableViewCell
{
    // MARK: - Var
    var place: GooglePlaces?
    {
        didSet
        {
            if let place = place
            {
                self.setLabels(withName: place.name, andAddress: place.vicinity)
                self.setImage(place.photos.photos.first?.photoReference ?? "")
            }
        }
    }
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeAddressLabel: UILabel!
    
    
    // MARK: - Life Cycle
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        
    }
    
    
    // MARK: - Configurations
    private func setLabels(withName name: String, andAddress address: String)
    {
        placeNameLabel.text = name
        placeAddressLabel.text = address
    }

    private func setImage(_ stringImage: String)
    {
        let urlImage = GenerateURL.get(type: .photo, location: stringImage)
        placeImage.download(image: urlImage, placeholder: Image.placeholderStore.rawValue)
    }
}
