//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Ammar Ahmed on 18/06/1445 AH.
//  Copyright © 1445 AH Apple. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack{
            landmark.image.resizable()
                .frame(width: 50,height: 50)
                .clipShape(Capsule())
            
            Text(landmark.name)
                .font(.title3)
                .foregroundStyle(.primary)
            
            Spacer()
                
        }
        .padding(.leading,10)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    Group{
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])

    }
    
}


