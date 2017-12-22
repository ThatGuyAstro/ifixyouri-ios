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

class LocationsViewController: UIViewController, GMSMapViewDelegate {

    var stores = [Int]()

    var storeId = 0
    
    var jsonString: JSON?

    
    @IBOutlet weak var mapView: GMSMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        
        //Change this to user's location later on
        let camera = GMSCameraPosition.camera(withLatitude: 26.9342, longitude: -80.0942, zoom: 12.0)
        mapView.camera = camera
        
        fetchLocations()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        
        print("Tapped marker w/ title of \(marker.title)")
        
        let json = self.jsonString!
        
        
        print("Json data \(json)")

        print(json.count)
        
        for i in 0...(json.count - 1) {
            
            print("Location...")
            
            print("Friendly name: \(json[i]["friendly_name"].stringValue) and marker title: \(marker.title)")

            
            if(json[i]["friendly_name"].stringValue == marker.title) {
                
                
                storeId = json[i]["id"].intValue
                performSegue(withIdentifier: "segueStore", sender: nil)

                
            }
            
            
        
            
            
        }
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueStore" {
            
            if let destination = segue.destination as? StoreViewController {
                
                //Get our store id
                
                
                destination.storeId = storeId
                
                
                //destination.selectedItem = Products[tableView.indexPathForSelectedRow!.row]
                
            }
        }
    }
    
    
    
    
    func fetchLocations() {
        
        
        
        let url = api.locations
        
        let request = Alamofire.request(url, method: HTTPMethod.get, encoding: JSONEncoding.default, headers: nil)
        request.responseJSON { response in
            
            if let data = response.data {
                
                
                let json = JSON(data: data)
                
                self.jsonString = json

                
                    for i in 0...(json.count - 1) {
                        
                        print("Location...")
                        
                        var lat = 0.0
                        var lng = 0.0
                        var title = "..."
                        var address = ""
                        var id = 0
                        
                        lat = json[i]["lat"].doubleValue
                        lng = json[i]["lng"].doubleValue
                        title = json[i]["friendly_name"].stringValue
                        address = json[i]["address"].stringValue
                        id = json[i]["id"].intValue
                        
                        print(address)
                        
                        let store = id
                        
                        self.stores.append(store)
                        
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
