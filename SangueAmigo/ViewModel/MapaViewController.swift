//
//  MapaViewController.swift
//  SangueAmigo
//
//  Created by Jailson Liberato on 12/05/2018.
//  Copyright © 2018 Jailson Liberato. All rights reserved.
//

import UIKit
import MapKit
class MapaViewController : UIViewController, MKMapViewDelegate{
     @IBOutlet var mapView : MKMapView!
    let locManager = CLLocationManager()
     var pin = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addBackbutton(title: "Voltar")
        locManager.requestWhenInUseAuthorization()
      
            let lat = -8.05428
            let lon = -34.8813
            let center  = CLLocationCoordinate2D(latitude: lat, longitude: lon)
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            let location = MKCoordinateRegion(center: center, span: span)
            self.mapView.setRegion(location, animated: true)
            pin.coordinate = location.center
            pin.title = "Clínica X"
            self.mapView.addAnnotation(pin)
            self.mapView.delegate = self
        
    }
}
