//
//  landmarkDetails.swift
//  Landmarks
//
//  Created by Ammar Ahmed on 18/06/1445 AH.
//  Copyright © 1445 AH Apple. All rights reserved.
//

import SwiftUI

struct landmarkDetails: View {
    var landmark:Landmark
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)

            CircleImage(Image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)

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
    landmarkDetails(landmark: landmarks[0])
}
