//
//  CarRepairDetailViewController.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 03/07/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class CarRepairDetailViewController: CustomViewController
{
    // MARK: - Lets and Vars
    var placeID: String?
    let locationManager = CLLocationManager()
    var detailPlaceViewModel: GooglePlacesDetailViewModel?
    {
        didSet
        {
            detailPlaceViewModel?.detailPlaceDidChange = { [weak self] viewModel in
                
                self?.loadData()
                self?.tapGestureToCall()
                self?.tapGestureToSafariVC()
                Spinner.shared.stopAnimating()
            }
        }
    }
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var siteLabel: UILabel!
    @IBOutlet weak var backgroundOpeningHoursView: UIView!
    @IBOutlet weak var weekdayLabel: UILabel!
    @IBOutlet weak var openNowLabel: UILabel!
    @IBOutlet weak var reviewsButton: UIButton!
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()

        detailPlaceViewModel = GooglePlacesDetailViewModel()
        
        configMapView()
        configBackgroundOpeningHoursView()
        configButton()
        
        self.set(title: "Detalhe")
        
        loadDetail()
    }

    
    
    // MARK: - Configurations
    private func configMapView()
    {
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self as? CLLocationManagerDelegate
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        
        if let coor = mapView.userLocation.location?.coordinate{
            mapView.setCenter(coor, animated: true)
        }
    }
    
    private func configBackgroundOpeningHoursView()
    {
        backgroundOpeningHoursView.cornerWithBorder(withColor: UIColor.lightGray, width: 1, andRadius: Radius.ten.rawValue)
    }
    
    private func configButton()
    {
        reviewsButton.buttonWhiteWithBlueBorder()
    }
    
    func loadData()
    {
        setLabels()
    }
    
    private func setLabels()
    {
        nameLabel.text = detailPlaceViewModel?.detailPlace?.name ?? ""
        ratingLabel.text = String(detailPlaceViewModel?.detailPlace?.rating ?? 0)
        addressLabel.text = detailPlaceViewModel?.detailPlace?.formattedAddress ?? ""
        phoneLabel.text = detailPlaceViewModel?.detailPlace?.formattedPhoneNumber ?? ""
        siteLabel.text = detailPlaceViewModel?.detailPlace?.website ?? ""
        weekdayLabel.text = detailPlaceViewModel?.detailPlace?.openingHours.weekdayText.map({"\($0)"}).joined(separator: "\n")
        openNowLabel.text = (detailPlaceViewModel?.detailPlace?.openingHours.openNow == true ? "Aberto" : "Fechado")
    }
    
    
    // MARK: - Tap Gesture
    func tapGestureToCall()
    {
        self.configGestureView(view: phoneLabel, destination: .call, value: detailPlaceViewModel?.detailPlace?.formattedPhoneNumber ?? "")
    }
    
    func tapGestureToSafariVC()
    {
        self.configGestureView(view: siteLabel, destination: .safari, value: detailPlaceViewModel?.detailPlace?.website ?? "")
    }
    
    
    // MARK: - Request
    private func loadDetail()
    {
        Spinner.shared.show(view: self.view)
        let url = GenerateURL.get(type: .googlePlaceDetail, location: placeID)
        
        detailPlaceViewModel?.request(withURL: url, completion: { (error) in
            Spinner.shared.stopAnimating()
            self.setNavigationType(.present, viewController: Alert.show(message: error?.localizedDescription))
        })
    }
    
    
    // MARK: - IBAction
    @IBAction func showReviews(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: Segue.openReviews.rawValue, sender: detailPlaceViewModel?.detailPlace?.reviews)
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == Segue.openReviews.rawValue
        {
            let destination = segue.destination as! ReviewsViewController
            
            if let reviews = sender as? ListReviews
            {
                destination.reviews = reviews
            }
        }
    }
    
}


extension CarRepairDetailViewController: MKMapViewDelegate
{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
//        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
//
//        mapView.mapType = MKMapType.standard
//
//        let span = MKCoordinateSpanMake(0.05, 0.05)
//        let region = MKCoordinateRegion(center: locValue, span: span)
//        mapView.setRegion(region, animated: true)
//
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = locValue
//        annotation.title = "Javed Multani"
//        annotation.subtitle = "current location"
//        mapView.addAnnotation(annotation)
        
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.mapView.setRegion(region, animated: true)
        
        //centerMap(locValue)
    }
}
