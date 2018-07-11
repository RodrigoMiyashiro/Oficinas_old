//
//  CarRepairListViewController.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 03/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import CoreLocation
import UIScrollView_InfiniteScroll

class CarRepairListViewController: CustomViewController
{
    // MARK: - Lets and Vars
    let locationManager = CLLocationManager()
    var currentLat: String?
    var currentLng: String?
    var placesViewModel: GooglePlacesViewModel?
    {
        didSet
        {
            placesViewModel?.placesDidChanged = { [weak self] viewModel in
                self?.placeTableView.reloadData()
                self?.refreshControl.endRefreshing()
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

        Spinner.shared.show(view: self.view)
        configNotificationCenter()
        configPullToRefresh(object: placeTableView)
        infinityScroll()
        
        
    }
    
    
    // MARK: - Configuration
    private func configNotificationCenter()
    {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeground), name: Notification.Name.UIApplicationDidBecomeActive, object: nil)
    }
    
    private func getLocation()
    {
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.denied || CLLocationManager.authorizationStatus() == .notDetermined
        {
            alertControl()
        }
        else
        {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    private func alertControl()
    {
        self.setNavigationType(.present, viewController: Alert.show(title: "Habilitar geolocalização", message: "Precisamos da sua localização para mostrá-lo as oficinas mais próximas a você.", completion: { (status) in
            if status
            {
                self.openSettingURL()
            }
        }))
    }
    
    @objc func appMovedToForeground()
    {
        getLocation()
    }
    
    
    // MARK: - Request
    override func refresh()
    {
        placesViewModel?.places?.nextPageToken = ""
        loadPlaces()
    }
    
    func infinityScroll()
    {
        placeTableView.addInfiniteScroll { (tableView) in
            if self.placesViewModel?.places?.nextPageToken != ""
            {
                self.loadPlaces()
            }
            tableView.finishInfiniteScroll()
        }
    }
    
    func loadPlaces()
    {
        locationManager.stopUpdatingLocation()
        
        placesViewModel?.request(withLatLng: self.currentLat ?? "", self.currentLng ?? "", completion: { (error) in
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


// MARK: - Extension CLLocationManager Delegate
extension CarRepairListViewController: CLLocationManagerDelegate
{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        
        self.currentLat = String(locValue.latitude)
        self.currentLng = String(locValue.longitude)
        self.refresh()
    }
    
    
}


// MARK: - Extension TableView DataSource
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


// MARK: - Extension TableView Delegate
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
