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
    
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var placeTableView: UITableView!
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()

        placeTableView.tableFooterView = UIView()
    }

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension CarRepairListViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = placeTableView.dequeueReusableCell(withIdentifier: CellIdentifier.carRepairCell.rawValue, for: indexPath) as! CarRepairListTableViewCell
        
        return cell
    }
}


extension CarRepairListViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        placeTableView.deselectRow(at: indexPath, animated: true)
        
        self.performSegue(withIdentifier: Segue.showCarRepairDetail.rawValue, sender: nil)
    }
}
