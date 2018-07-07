//
//  ReviewsViewController.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 07/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class ReviewsViewController: CustomViewController
{
    // MARK: Lets and Vars
    var reviews: ListReviews?
    
    // MARK: IBOutlets
    @IBOutlet weak var reviewsTableView: UITableView!
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.set(title: "Comentários")
        
        reviewsTableView.tableFooterView = UIView()
        reviewsTableView.reloadData()
    }

}


extension ReviewsViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return reviews?.list.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = reviewsTableView.dequeueReusableCell(withIdentifier: CellIdentifier.reviewsCell.rawValue, for: indexPath) as! ReviewsTableViewCell
        
        let row = indexPath.row
        let review = reviews?.list[row]
        
        cell.review = review
        
        return cell
    }
}

//extension ReviewsTableViewCell: UITableViewDelegate
//{
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
//    {
//        return 140 //UITableViewAutomaticDimension
//    }
//
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
//    {
//        return UITableViewAutomaticDimension
//    }
//}

