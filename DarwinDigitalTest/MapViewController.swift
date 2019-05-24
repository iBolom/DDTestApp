//
//  MapViewController.swift
//  DarwinDigitalTest
//
//  Created by Bojan Markovic on 24/05/2019.
//  Copyright © 2019 Bojan. All rights reserved.
//

import Foundation
import UIKit
import MapKit

final class MapViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var mapView: MKMapView?
    
    // MARK: - Properties
    var users: [User] = [] {
        didSet {
            addAnnotationsOnMapIfNeeded()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAnnotationsOnMapIfNeeded()
    }
    
    // MARK: Methods
    private func addAnnotationsOnMapIfNeeded() {
        if let mapView = mapView, mapView.annotations.isEmpty {
            for user in users {
                let userAnnotoation = UserAnnotation(title: user.name, coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(user.address.geo.lat)!, longitude: CLLocationDegrees(user.address.geo.lng)!))
                mapView.addAnnotation(userAnnotoation)
            }
        }
    }
}
