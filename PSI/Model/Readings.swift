//
//  Readings.swift
//  PSI
//
//  Created by Muchamad Chozinul Amri on 14/4/18.
//  Copyright © 2018 Muchamad Chozinul Amri. All rights reserved.
//

import UIKit
import ObjectMapper

class Readings: Mappable {
    
    var o3_sub_index:Reading?
    var pm10_twenty_four_hourly:Reading?
    var pm10_sub_index:Reading?
    var co_sub_index:Reading?
    var pm25_twenty_four_hourly:Reading?
    var so2_sub_index:Reading?
    var co_eight_hour_max:Reading?
    var no2_one_hour_max:Reading?
    var so2_twenty_four_hourly:Reading?
    var pm25_sub_index:Reading?
    var psi_twenty_four_hourly:Reading?
    var o3_eight_hour_max:Reading?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        o3_sub_index <- map["o3_sub_index"]
        pm10_twenty_four_hourly <- map["pm10_twenty_four_hourly"]
        pm10_sub_index <- map["pm10_sub_index"]
        co_sub_index <- map["co_sub_index"]
        pm25_twenty_four_hourly <- map["pm25_twenty_four_hourly"]
        so2_sub_index <- map["so2_sub_index"]
        co_eight_hour_max <- map["co_eight_hour_max"]
        no2_one_hour_max <- map["no2_one_hour_max"]
        so2_twenty_four_hourly <- map["so2_twenty_four_hourly"]
        pm25_sub_index <- map["pm25_sub_index"]
        psi_twenty_four_hourly <- map["psi_twenty_four_hourly"]
        o3_eight_hour_max <- map["o3_eight_hour_max"]
    }
}
