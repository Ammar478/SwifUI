//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Ammar Ahmed on 18/06/1445 AH.
//  Copyright © 1445 AH Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    
    @State private var showFavoritesOnly = false
    
    var favoriteLandmarks:[Landmark] {
        landmarks.filter{landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView{
            List{
                
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                }
                
                ForEach(favoriteLandmarks, id: \.id) { landmark in
                    NavigationLink{
                        landmarkDetails(landmark: landmark)
                        
                    }label: {
                        LandmarkRow(landmark: landmark)
                    }
                    
                    
                }
            }
            .animation(.default,value: favoriteLandmarks)
            .navigationTitle("Landmarks")
            
        } detail: {
            Text("Select a Landmark")
        }
        
    }
}

#Preview {
    LandmarkList()
}
