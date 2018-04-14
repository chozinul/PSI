//
//  Region.swift
//  PSI
//
//  Created by Muchamad Chozinul Amri on 14/4/18.
//  Copyright © 2018 Muchamad Chozinul Amri. All rights reserved.
//

import UIKit
import ObjectMapper
import CoreLocation

class Region: Mappable {
    var name:String?
    var labelLocation:Location?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        labelLocation <- map["label_location"]
    }
    
}
