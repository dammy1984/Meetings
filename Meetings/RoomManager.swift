//
//  RoomManager.swift
//  Meetings
//
//  Created by Basavaraj KM on 13/02/20.
//  Copyright © 2020 Basavaraj KM. All rights reserved.
//

import Foundation

class RoomManager: ObservableObject {
    static let shared = RoomManager()
    @Published var rooms:[Room]
    
   
    private init(){
        rooms = load("Room.json")
    }
    
    func add(room: Room){
        rooms.insert(room, at: 0)
    }
    
    func delete(room: Room){
        guard let index  = rooms.firstIndex(of:room) else {
            return
        }
        rooms.remove(at: index)
    }
    
    func delete(atoffsets offsets: IndexSet) {
        rooms.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        rooms.move(fromOffsets: source, toOffset: destination)
    }
}
