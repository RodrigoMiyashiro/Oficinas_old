//
//  ReviewsTableViewCell.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 07/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class ReviewsTableViewCell: UITableViewCell
{
    // MARK: - Lets and Vars
    var review: Review?
    {
        didSet
        {
            if let review = review
            {
                self.setLabels(name: review.authorName, rating: String(review.rating), text: review.text, time: review.relativeTimeDescription)
                self.setImage(review.profilePhotoURL)
            }
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var userReviewImage: UIImageView!
    @IBOutlet weak var userNameReviewLabel: UILabel!
    @IBOutlet weak var userRatingReviewLabel: UILabel!
    @IBOutlet weak var textReviewLabel: UILabel!
    @IBOutlet weak var relativeTimeDescriptionReviewLabel: UILabel!
    
    
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    
//        configImage()
    }

    private func configImage()
    {
        userReviewImage.circleView()
    }
    
    
    private func setLabels(name: String, rating: String, text: String, time: String)
    {
        userNameReviewLabel.text = name
        userRatingReviewLabel.text = rating
        textReviewLabel.text = text
        relativeTimeDescriptionReviewLabel.text = time
    }
    
    private func setImage(_ urlImage: String)
    {
        userReviewImage.download(image: urlImage, placeholder: Image.placeholderUser.rawValue)
    }

}
