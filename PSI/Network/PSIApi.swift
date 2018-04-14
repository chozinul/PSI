//
//  PSIApi.swift
//  PSI
//
//  Created by Muchamad Chozinul Amri on 14/4/18.
//  Copyright © 2018 Muchamad Chozinul Amri. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class PSIApi: NSObject {
    
    static let baseURL = "https://api.data.gov.sg/v1/environment/psi"
    
    static func GetPSI(completion:((Psi?)->())?) {
        let URL = baseURL
        
        
        let parameters: Parameters = [
            "date_time": Date().formatterString()!
        ]
        
        Alamofire.request(URL,
                          method: .get,
                          parameters: parameters,
                          encoding: URLEncoding(destination: .queryString),
                          headers: ["accept": "application/json"]).responseObject { (response: DataResponse<Psi>) in
            let psiData = response.result.value
            completion?(psiData);
        }
    }
}
