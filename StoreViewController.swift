//
//  StoreViewController.swift
//  iFixYouri Check In
//
//  Created by Sam Elder on 12/21/17.
//  Copyright © 2017 Sam Elder. All rights reserved.
//

import UIKit

import GoogleMaps

import Alamofire
import SwiftyJSON

class StoreViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var btnCall: UIButton!
    @IBOutlet weak var btnReview: UIButton!
    @IBOutlet weak var btnDirections: UIButton!
    @IBOutlet weak var btnCheckIn: UIButton!
    
    @IBOutlet weak var scrollViewContainer: UIScrollView!
    
    @IBOutlet weak var labelStoreName: UILabel!
    @IBOutlet weak var labelOpenUntil: UILabel!
    @IBOutlet weak var labelEstimatedWait: UILabel!
    
    @IBOutlet weak var btnBuyDevice: UIButton!
    
    private var _storeId: Int!
    
    var storeId: Int {
        get {
            return _storeId
        } set {
            _storeId = newValue
        }
    }
    
    var lat = 0.0
    var lng = 0.0
    var friendlyName = ""
    var address = ""
    var id = 0
    
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
        
        let url = api.location + String(storeId)
        
        let request = Alamofire.request(url, method: HTTPMethod.get, encoding: JSONEncoding.default, headers: nil)
        request.responseJSON { response in
            
            if let data = response.data {
                
                
                let json = JSON(data: data)

                    
                self.lat = json["lat"].doubleValue
                self.lng = json["lng"].doubleValue
                self.friendlyName = json["friendly_name"].stringValue
                self.address = json["address"].stringValue
                self.id = json["id"].intValue
                                    
                let marker = GMSMarker()
                    
                marker.position = CLLocationCoordinate2D(latitude: self.lat, longitude: self.lng)
                marker.title = self.title
                marker.snippet = self.address
                marker.map = self.mapView
                
                let storeLocation = CLLocationCoordinate2D(latitude: self.lat, longitude: self.lng)
                let storeCamera = GMSCameraUpdate.setTarget(storeLocation, zoom: 14.0)
                self.mapView.animate(with: storeCamera)
                
                self.labelStoreName.text = "iFixYouri \(self.friendlyName)"

                
            }
        }
        
        print(self.friendlyName)
        
        
        self.mapView.layer.cornerRadius = 5;
        self.mapView.layer.masksToBounds = true;
        
        self.scrollViewContainer.contentSize.height = 1500
    
        
        self.btnBuyDevice.layer.cornerRadius = 7.5
        self.btnBuyDevice.layer.borderColor = ui.mainClor.cgColor
        self.btnBuyDevice.setTitleColor(ui.mainClor, for: .normal)
        self.btnBuyDevice.layer.borderWidth = 1
        
        
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
