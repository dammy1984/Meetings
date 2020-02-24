//
//  Room.swift
//  Meetings
//
//  Created by Basavaraj KM on 12/02/20.
//  Copyright © 2020 Basavaraj KM. All rights reserved.
//

import Foundation
import SwiftUI

struct Room : Hashable,Codable,Identifiable {
    let id = UUID()
    let name : String
    let building : String
    let floor : Int
    let capacity : Int
    let hasProjector : Bool
    let imageName : String
    let email : String

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case building = "building"
        case floor = "floor"
        case capacity = "capacity"
        case hasProjector = "hasProjector"
        case imageName = "imageName"
        case email = "email"
    }
}

extension Room {
    var location: String {
        if capacity == 0 {
            return "\(building), GF"
        }
        return "\(building), \(floor)F"
    }
}

#if DEBUG
let testData = [
    Room(name: "HMS2-3F-MR-01", building: "Smiles2", floor: 3, capacity: 10, hasProjector: true, imageName: "Smiles2", email: "HMS2-3F-MR-01@happiestminds.com"),
    Room(name: "HMS1-2F-MR-01", building: "Smiles1", floor: 2, capacity: 6, hasProjector: false, imageName: "Smiles1", email: "HMS1-2F-MR-01@happiestminds.com"),
    Room(name: "HMS3-1F-MR-01", building: "Smiles3", floor: 1, capacity: 4, hasProjector: false, imageName: "Smiles3", email: "HMS3-1F-MR-01@happiestminds.com"),
    Room(name: "HMS4-GF-MR-01", building: "Smiles4", floor: 0, capacity: 2, hasProjector: true, imageName: "Smiles4", email: "HMS4-GF-MR-01@happiestminds.com")
]
#endif
