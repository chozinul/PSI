//
//  Psi.swift
//  PSI
//
//  Created by Muchamad Chozinul Amri on 14/4/18.
//  Copyright © 2018 Muchamad Chozinul Amri. All rights reserved.
//

import UIKit
import ObjectMapper

class Psi: Mappable {
    var regionMetadata:[Region]?
    var items:[Item]?
    var apiInfo:APIInfo?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        regionMetadata <- map["region_metadata"]
        items <- map["items"]
        apiInfo <- map["api_info"]
    }
}
