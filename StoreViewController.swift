//
//  StoreViewController.swift
//  iFixYouri Check In
//
//  Created by Sam Elder on 12/21/17.
//  Copyright © 2017 Sam Elder. All rights reserved.
//

import UIKit

import GoogleMaps

class StoreViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var btnCall: UIButton!
    @IBOutlet weak var btnReview: UIButton!
    @IBOutlet weak var btnDirections: UIButton!
    @IBOutlet weak var btnCheckIn: UIButton!
    
    @IBOutlet weak var scrollViewContainer: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        loadUi()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapCheckIn(_ sender: Any) {
        
        performSegue(withIdentifier: "segueCheckIn", sender: nil)
        
    }
    
    
    func loadUi() {
        
        self.scrollViewContainer.contentSize.height = 1500
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 26.935416, longitude: -80.092185)
        marker.title = "iFixYouri"
        marker.snippet = "75 E Indiantown Rd Suite 604, Jupiter, FL 33477"
        marker.map = self.mapView
        
        let storeLocation = CLLocationCoordinate2D(latitude: 26.935416, longitude: -80.092185)
        let storeCamera = GMSCameraUpdate.setTarget(storeLocation, zoom: 14.0)
        mapView.animate(with: storeCamera)
        
        self.btnCall.layer.cornerRadius = 7.5
        self.btnCall.layer.borderColor = ui.mainClor.cgColor
        self.btnCall.setTitleColor(ui.mainClor, for: .normal)
        self.btnCall.layer.borderWidth = 1
        
        self.btnReview.layer.cornerRadius = 7.5
        self.btnReview.layer.borderColor = ui.mainClor.cgColor
        self.btnReview.setTitleColor(ui.mainClor, for: .normal)
        self.btnReview.layer.borderWidth = 1
        
        self.btnDirections.layer.cornerRadius = 7.5
        self.btnDirections.layer.borderColor = ui.mainClor.cgColor
        self.btnDirections.setTitleColor(ui.mainClor, for: .normal)
        self.btnDirections.layer.borderWidth = 1
        
        self.btnCheckIn.layer.cornerRadius = 7.5
        self.btnCheckIn.layer.borderColor = ui.mainClor.cgColor
        self.btnCheckIn.setTitleColor(ui.mainClor, for: .normal)
        self.btnCheckIn.layer.borderWidth = 1
        
    }
    


}
