//
//  RoomDetailsView.swift
//  Meetings
//
//  Created by Basavaraj KM on 13/02/20.
//  Copyright © 2020 Basavaraj KM. All rights reserved.
//

import SwiftUI

struct RoomDetailsView: View {
    var room: Room
    
    @State private var zoomed = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if room.location.count > 0 && !zoomed {
                Text(room.location)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top)
                    .transition(.move(edge: .top))
            }
            
            ImageStore.shared.image(name: room.imageName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .navigationBarTitle(Text(room.name), displayMode: .inline).onTapGesture {
                    withAnimation { self.zoomed.toggle() }
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            if room.hasProjector && !zoomed {
                Image(systemName: "video.fill").font(.largeTitle).padding(.all).transition(.move(edge: .leading))
            }
        }
    }
}

struct RoomDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                RoomDetailsView(room: testData[0])
            }
            NavigationView {
                RoomDetailsView(room: testData[1])
            }
        }
    }
}
