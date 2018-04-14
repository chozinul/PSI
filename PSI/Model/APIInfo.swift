//
//  APIInfo.swift
//  PSI
//
//  Created by Muchamad Chozinul Amri on 14/4/18.
//  Copyright © 2018 Muchamad Chozinul Amri. All rights reserved.
//

import UIKit
import ObjectMapper

class APIInfo: Mappable {
    
    var status:String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
    }
}
