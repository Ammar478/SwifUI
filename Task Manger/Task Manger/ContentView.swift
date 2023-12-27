//
//  ContentView.swift
//  Task Manger
//
//  Created by Ammar Ahmed on 14/06/1445 AH.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            Home()
                .navigationTitle("Task Manger")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
