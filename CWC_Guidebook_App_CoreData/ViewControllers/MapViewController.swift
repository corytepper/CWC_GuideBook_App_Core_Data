//
//  MapViewController.swift
//  CWC_Guidebook_App_CoreData
//
//  Created by Cory Tepper on 3/1/21.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    // MARK: - Variables and Properties

    @IBOutlet var mapView: MKMapView!
    
    var place:Place?
    
    // MARK: - ViewController Lifecycle


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if place != nil {
            
            // Create a CLLoactionCoordinate2D
            let location = CLLocationCoordinate2D(latitude: place!.lat, longitude: place!.long)
            
            // Create a pin
            let pin = MKPointAnnotation()
            pin.coordinate = location
            
            // Add it to the map
            mapView.addAnnotation(pin)
            
            // Create a region to zoom to
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 100, longitudinalMeters: 100)
            
            mapView.setRegion(region, animated: false)
            
        }
    }
}
