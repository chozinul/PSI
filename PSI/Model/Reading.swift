//
//  Reading.swift
//  PSI
//
//  Created by Muchamad Chozinul Amri on 14/4/18.
//  Copyright © 2018 Muchamad Chozinul Amri. All rights reserved.
//

import UIKit
import ObjectMapper

class Reading: Mappable {
    var west:Int?
    var national:Int?
    var east:Int?
    var central:Int?
    var south:Int?
    var north:Int?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        west <- map["west"]
        national <- map["national"]
        east <- map["east"]
        central <- map["central"]
        south <- map["south"]
        north <- map["north"]
    }
}
