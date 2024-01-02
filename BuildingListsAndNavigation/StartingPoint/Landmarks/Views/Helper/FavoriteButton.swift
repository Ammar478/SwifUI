//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Ammar Ahmed on 20/06/1445 AH.
//  Copyright © 1445 AH Apple. All rights reserved.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isFav:Bool
    
    var body: some View {
        Button {
                  isFav.toggle()
              } label: {
                  Label("Toggle Favorite", systemImage: isFav ? "star.fill" : "star")
                      .labelStyle(.iconOnly)
                      .foregroundStyle(isFav ? .yellow : .gray)
              }
    }
}

#Preview {
    FavoriteButton(isFav: .constant(true))
}
