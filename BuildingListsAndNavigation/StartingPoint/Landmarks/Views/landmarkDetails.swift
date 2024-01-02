//
//  landmarkDetails.swift
//  Landmarks
//
//  Created by Ammar Ahmed on 18/06/1445 AH.
//  Copyright © 1445 AH Apple. All rights reserved.
//

import SwiftUI

struct landmarkDetails: View {
    @Environment(ModelData.self) var modelData
    var landmark:Landmark
    
    var landmarkIndex :Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)

            CircleImage(Image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack{
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isFav: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                

                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)

                Divider()

                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            .navigationTitle(landmark.name)
            .navigationBarTitleDisplayMode(.inline)

            Spacer()
        }
    }
}

#Preview {
    
    let modeData = ModelData()
    return landmarkDetails(landmark: modeData.landmarks[0])
}
