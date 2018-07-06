//
//  CarRepairListViewController.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 03/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class CarRepairListViewController: CustomViewController
{
    // MARK: - Lets and Vars
    var placesViewModel: GooglePlacesViewModel?
    {
        didSet
        {
            placesViewModel?.placesDidChanged = { [weak self] viewModel in
                self?.placeTableView.reloadData()
                Spinner.shared.stopAnimating()
            }
        }
    }
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var placeTableView: UITableView!
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()

        placesViewModel = GooglePlacesViewModel()
        placeTableView.tableFooterView = UIView()
        
        self.set(title: "Oficinas Mecânicas")
        
        loadPlaces()
    }

    
    
    // MARK: - Request
    func loadPlaces()
    {
        Spinner.shared.show(view: self.view)
     
        placesViewModel?.request(completion: { (error) in
            Spinner.shared.stopAnimating()
            self.setNavigationType(.present, viewController: Alert.show(message: error?.localizedDescription))
        })
    }

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == Segue.showCarRepairDetail.rawValue
        {
            let destination = segue.destination as! CarRepairDetailViewController
            
            if let placeID = sender as? String
            {
                destination.placeID = placeID
            }
        }
    }
}


extension CarRepairListViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return placesViewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = placeTableView.dequeueReusableCell(withIdentifier: CellIdentifier.carRepairCell.rawValue, for: indexPath) as! CarRepairListTableViewCell
        let row = indexPath.row
        let currentPlace = placesViewModel?.places?.list[row]
        
        cell.place = currentPlace
        
        return cell
    }
}


extension CarRepairListViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        placeTableView.deselectRow(at: indexPath, animated: true)
        
        let row = indexPath.row
        let placeSelected = placesViewModel?.places?.list[row]
        self.performSegue(withIdentifier: Segue.showCarRepairDetail.rawValue, sender: placeSelected?.placeID)
    }
}
