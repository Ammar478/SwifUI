//
//  InfoView.swift
//  swiftUIDemo
//
//  Created by Ammar Ahmed on 11/06/1445 AH.
//

import SwiftUI

struct InfoView: View {
    
    var text:String
    var icon:String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(.white)
            .frame(height: 50)
            .overlay(HStack {
                Image(systemName:icon)
                    .foregroundColor(.black)
                Text(text)}).padding(.all)
    }
}


#Preview {
    InfoView(text:"PlaceHolder", icon: "phone").previewLayout(.sizeThatFits)
}
