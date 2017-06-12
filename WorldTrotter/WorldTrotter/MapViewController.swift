//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Robert Wong on 5/22/17.
//  Copyright © 2017 Robert Wong. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController, MKMapViewDelegate {
    
    var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("MapViewController loaded its view.")
        
    }
    
    override func loadView()
    {
        //Create a map view
        mapView = MKMapView()
        
        //set it as *the* view of the view controller
        view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self,
                                   action: #selector(MapViewController.mapTypeChanged(_:)),
                                   for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor , constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        
        //////Button Creation
        let locateButton = UIButton.init(type: .system)
        locateButton.setTitle("?", for: .normal)
        locateButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(locateButton)
        
        let topConstraintButton = locateButton.topAnchor.constraint(equalTo:segmentedControl.topAnchor, constant: 32 )
        let leadingConstraintButton = locateButton.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor)
        let trailingConstraintButton = locateButton.trailingAnchor.constraint(equalTo: segmentedControl.trailingAnchor)
        
        topConstraintButton.isActive = true
        leadingConstraintButton.isActive = true
        trailingConstraintButton.isActive = true
        
    }
    
    func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
//    func mapViewWillStartLocatingUser(_ mapView: MKMapView)
//    {
//        mapView.showsUserLocation = true
//    }
}
