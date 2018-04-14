//
//  DateExtention.swift
//  PSI
//
//  Created by Muchamad Chozinul Amri on 14/4/18.
//  Copyright © 2018 Muchamad Chozinul Amri. All rights reserved.
//

import Foundation

public extension Date {
    
    init?(fromString string: String) {
        guard !string.isEmpty else {
            return nil
        }
        let string = string
        let dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        guard let date = formatter.date(from: string) else {
            return nil
        }
        self.init(timeInterval:0, since:date)
    }
    
    func formatterString() -> String? {
        let dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.string(from: self)
    }
    
    func displayable() -> String {
        let dateFormat = "HH:mm, dd MMM yyyy"
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.string(from: self)
    }
    
}
