//
//  MapViewController.swift
//  Classifieds
//
//  Created by Joe Nguyen on 10/5/18.
//  Copyright © 2018 Joe Nguyen. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // Check for Location Services
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
        }
        self.mapView.showsUserLocation = true

        //Zoom to user location
        if let userLocation = locationManager.location?.coordinate {
            let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 200, longitudinalMeters: 200)
            mapView.setRegion(viewRegion, animated: false)
        }
        
        self.locationManager = locationManager
        
        let addButtonTap = UITapGestureRecognizer(target: self, action: #selector(addButtonTapped(_:)))
        addButton.addGestureRecognizer(addButtonTap)
        DispatchQueue.main.async {
            self.locationManager.startUpdatingLocation()
        }
        
        // Do any additional setup after loading the view.
    }
    
     func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        let location = locations.last as! CLLocation
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        var region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        region.center = mapView.userLocation.coordinate
        mapView.setRegion(region, animated: true)
        
    }
    
    // MARK: - TAP GESTURES
    
    let addLauncher = AddLauncher()

    @objc func addButtonTapped(_ sender: UITapGestureRecognizer){
        
       self.addLauncher.showAddOptions()
        
        print("tapped")
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
