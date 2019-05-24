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
    var selectedUserIdx: Int = 0
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView?.delegate = self
        addAnnotationsOnMapIfNeeded()
    }
    
    // MARK: - Prepare for Seque
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? UserDetailViewController {
            detailVC.user = users[selectedUserIdx]
        }
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

// MARK: - MapViewController
extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let userAnnotoation = view.annotation {
            for (idx, user) in users.enumerated() {
                if user.name == userAnnotoation.title {
                    selectedUserIdx = idx
                    performSegue(withIdentifier: "showDetail", sender: nil)
                }
            }
        }
    }
}
