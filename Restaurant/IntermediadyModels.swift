//
//  IntermediadyModels.swift
//  Restaurant
//
//  Created by Fried on 04/12/2018.
//  Copyright © 2018 Fried. All rights reserved.
//

import Foundation

struct Categories: Codable {
    let categories: [String]
}

struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
