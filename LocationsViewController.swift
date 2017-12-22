//
//  LocationsViewController.swift
//  iFixYouri Check In
//
//  Created by Sam Elder on 12/21/17.
//  Copyright © 2017 Sam Elder. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON
import GoogleMaps

class LocationsViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let camera = GMSCameraPosition.camera(withLatitude: 26.9342, longitude: -80.0942, zoom: 12.0)
        mapView.camera = camera
        
        fetchLocations()
        
        // Creates a marker in the center of the map.

        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchLocations() {
        
        
        
        let url = api.locations
        
        let request = Alamofire.request(url, method: HTTPMethod.get, encoding: JSONEncoding.default, headers: nil)
        request.responseJSON { response in
            
            if let data = response.data {
                let json = JSON(data: data)
                
                
                
                    for i in 0...(json.count - 1) {
                        
                        print("Location...")
                        
                        var lat = 0.0
                        var lng = 0.0
                        var title = "..."
                        var address = ""
                        
                        lat = json[i]["lat"].doubleValue
                        lng = json[i]["lng"].doubleValue
                        title = json[i]["friendly_name"].stringValue
                        address = json[i]["address"].stringValue
                        
                        print(address)
                        
                        let marker = GMSMarker()
                        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lng)
                        marker.title = title
                        marker.snippet = address
                        marker.map = self.mapView
                        
                    }
                
                
            }
        }
        
    }
    


}
