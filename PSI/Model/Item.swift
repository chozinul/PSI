//
//  Item.swift
//  PSI
//
//  Created by Muchamad Chozinul Amri on 14/4/18.
//  Copyright © 2018 Muchamad Chozinul Amri. All rights reserved.
//

import UIKit
import ObjectMapper

class Item: Mappable {
    
    var timestamp:String?
    var updateTimestamp:String?
    var readings:Readings?
    
    func getTimestamp() -> Date? {
        guard let timestamp = timestamp else {
            return nil
        }
        return Date(fromString: timestamp);
    }
    
    func getUpdateTimestamp() -> Date? {
        guard let updateTimestamp = updateTimestamp else {
            return nil
        }
        return Date(fromString: updateTimestamp);
    }
    
    func getUpdateTimestampString() -> String? {
        let date = getUpdateTimestamp()
        return date?.displayable()
    }
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        timestamp <- map["timestamp"]
        updateTimestamp <- map["update_timestamp"]
        readings <- map["readings"]
    }
}
