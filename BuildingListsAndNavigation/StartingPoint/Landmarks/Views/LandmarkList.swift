//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Ammar Ahmed on 18/06/1445 AH.
//  Copyright © 1445 AH Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationSplitView{
            List(landmarks, id: \.id) { landmark in
                NavigationLink{
                   landmarkDetails(landmark: landmark)
                        
                }label: {
                    LandmarkRow(landmark: landmark)
                }
                
                
            }
            .navigationTitle("Landmarks")
            
        } detail: {
            Text("Select a Landmark")
        }
         
    }
}

#Preview {
    LandmarkList()
}
