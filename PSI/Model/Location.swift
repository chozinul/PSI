//
//  Location.swift
//  PSI
//
//  Created by Muchamad Chozinul Amri on 14/4/18.
//  Copyright © 2018 Muchamad Chozinul Amri. All rights reserved.
//

import UIKit
import ObjectMapper
import CoreLocation

class Location: Mappable {
    var latitude:Double?
    var longitude:Double?
    
    func getCLLocation() -> CLLocationCoordinate2D? {
        guard let latitude = latitude, let longitude = longitude else {
            return nil
        }
        return CLLocationCoordinate2DMake(latitude, longitude)
    }
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        latitude <- map["latitude"]
        longitude <- map["longitude"]
    }
}
