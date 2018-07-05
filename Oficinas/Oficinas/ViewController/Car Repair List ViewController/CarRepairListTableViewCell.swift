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
    // MARK: - IBOutlets
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeAddressLabel: UILabel!
    
    

    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        
    }

}
