//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Patrice Drayton on 2/24/22.
//


//Create a new view controller with a subclass MapViewController


import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
        //Create a map view
        mapView = MKMapView()
        //Set it as the view of this view controller
        view = mapView
        
        //Using programmatic constraints when views are built using code, add the segmented switch controller to the interface. A segmented control allows the user to choose among a discret set of options to include standard, hubrid, and satellite map types.  Autoresizing mask is an older IOS system for scaling interfaces before the introduction of Auto Layout.When working with Auto Layout programmatically, anchors must be used to create constraints. Anchors are properties on a view that correspond to attributes that you might want to constrain to an anchor on another view. UISegmentedControl is a subclass of UIControl; responsible for calling methods on their traget in response to an event.
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(mapDidChange(_:)), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        //constraint(equaltTo:) method creates a constraint between two anchors. safeAreaLayoutGuide exposes anchors that can be used to add constraints; using this instead of hard coding allows the views to adapt based on the context they appear in.
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        //layoutMargins property defaults the spacing to use when laying out content; is an instance of UIEdgeSets
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        // Trailing Constraint: trailing anchor of the segmented control should be equal to the trailing anchor of its superview.
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        //In order for these constraints to have an effect on the layout they must be activated by setting their isActive properties to true
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
    }
    
    @objc func mapDidChange(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
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
}


        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
//
//        func mapSegmentedControl() {
//            let items = ["Standard", "Hybrid", "Satellite"]
//            let segmentedControl = UISegmentedControl(items: items)
//            segmentedControl.addTarget(self, action: #selector(mapDidChange(_:)), for: .valueChanged)
//            segmentedControl.backgroundColor = UIColor.systemBackground
//            segmentedControl.selectedSegmentIndex = 0
//            segmentedControl.translatesAutoresizingMaskIntoConstraints = false
//            view.addSubview(segmentedControl)
//
//            //constraint(equaltTo:) method creates a constraint between two anchors. safeAreaLayoutGuide exposes anchors that can be used to add constraints; using this instead of hard coding allows the views to adapt based on the context they appear in.
//           //        //Top Constraint: the top anchor of the segmented control should be equal to the top anchor of its superview;
//                   let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
//           //        //layoutMargins property defaults the spacing to use when laying out content; is an instance of UIEdgeSets
//                   let margins = view.layoutMarginsGuide
//                  let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
//           //         // Trailing Constraint: trailing anchor of the segmented control should be equal to the trailing anchor of its superview.
//                   let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
//           //        //In order for these constraints to have an effect on the layout they must be activated by setting their isActive properties to true
//                   topConstraint.isActive = true
//                   leadingConstraint.isActive = true
//                   trailingConstraint.isActive = true
//
//        }
//    }
//
//
//
//
//    //@objc is needed to expose this method to the Objective-C runtime.
//    @objc func mapDidChange(_ segmentedControl: UISegmentedControl) {
//        switch segmentedControl.selectedSegmentIndex {
//        case 0:
//            mapView.mapType = .standard
//        case 1:
//            mapView.mapType = .hybrid
//        case 2:
//            mapView.mapType = .satellite
//        default:
//            break
//        }
//
//    }
//
//}








//Using programmatic constraints when views are built using code.  A segmented control allows the user to choose among a discret set of options to include standard, hubrid, and satellite map types.  Autoresizing mask is an older IOS system for scaling interfaces before the introduction of Auto Layout.When working with Auto Layout programmatically, anchors must be used to create constraints. Anchors are properties on a view that correspond to attributes that you might want to constrain to an anchor on another view. UISegmentedControl is a subclass of UIControl; responsible for calling methods on their traget in response to an event.

//        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
//        segmentedControl.backgroundColor = UIColor.systemBackground
//        segmentedControl.selectedSegmentIndex = 0
//        //add a target-action pair to the segmented control and associate it with the .valueChanged event
////       segmentedControl.addTarget(self, action: Selector(("mapTypeChanged_:")),for: .valueChanged)
//        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(segmentedControl)
//        //constraint(equaltTo:) method creates a constraint between two anchors. safeAreaLayoutGuide exposes anchors that can be used to add constraints; using this instead of hard coding allows the views to adapt based on the context they appear in.
//        //Top Constraint: the top anchor of the segmented control should be equal to the top anchor of its superview;
//        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
//        //layoutMargins property defaults the spacing to use when laying out content; is an instance of UIEdgeSets
//        let margins = view.layoutMarginsGuide
//        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
//         // Trailing Constraint: trailing anchor of the segmented control should be equal to the trailing anchor of its superview.
//        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
//        //In order for these constraints to have an effect on the layout they must be activated by setting their isActive properties to true
//        topConstraint.isActive = true
//        leadingConstraint.isActive = true
//        trailingConstraint.isActive = true
