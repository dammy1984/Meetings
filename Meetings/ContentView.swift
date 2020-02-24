//
//  ContentView.swift
//  Meetings
//
//  Created by Basavaraj KM on 12/02/20.
//  Copyright © 2020 Basavaraj KM. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var roomManager = RoomManager.shared
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: createRoom) {
                        Text("Add Room")
                    }
                }
                Section {
                    ForEach(roomManager.rooms) { room in
                        RoomCell(room: room)
                    }.onDelete { (offsets: IndexSet) in
                        self.deleteRoom(atoffsets: offsets)
                    }.onMove { (source: IndexSet, destination: Int) in
                        self.moveRoom(from: source, to: destination)
                    }
                }
            }
            .navigationBarTitle(Text("Rooms"), displayMode: .inline)
            .navigationBarItems(trailing: EditButton())
            .listStyle(GroupedListStyle())
        }
    }
    
    func createRoom() {
        roomManager.add(room: Room(name: "HMS1-GF-MR-01", building: "Smiles1", floor: 0, capacity: 35, hasProjector: true, imageName: "Smiles1", email: "HMS1-GF-MR-01@happiestminds.com"))
    }
    
    func deleteRoom(atoffsets offsets: IndexSet) {
        roomManager.delete(atoffsets: offsets)
    }
    
    func moveRoom(from source: IndexSet, to destination: Int) {
        roomManager.move(from: source, to: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            
            ContentView().previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            
            ContentView().environment(\.sizeCategory, .extraExtraExtraLarge)
            
            ContentView().environment(\.colorScheme, .dark)
            
            ContentView().environment(\.layoutDirection, .rightToLeft).environment(\.locale, Locale(identifier: "ar"))
        }
    }
}

struct RoomCell: View {
    var room: Room
    
    var body: some View {
        NavigationLink(destination: RoomDetailsView(room: room)) {
            ImageStore.shared.image(name: room.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8.0)
                .frame(width: 100.0, height: 100.0)
            
            VStack(alignment: .leading) {
                Text(room.name)
                    .font(.headline)
                Text("\(room.capacity) Peoples")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(room.location)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
