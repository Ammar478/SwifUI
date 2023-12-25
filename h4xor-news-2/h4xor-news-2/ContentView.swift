//
//  ContentView.swift
//  h4xor-news-2
//
//  Created by Ammar Ahmed on 11/06/1445 AH.
//

import SwiftUI

struct ContentView: View {
    
    @State private var newsPosts:NewsItems?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(newsPosts?.hits ?? [] ,id:\.objectID){post in
                    NavigationLink(value:post){
                        NewsCard(newsPost: post)
                    }
                }
            }
            .navigationBarTitle("H4xor News")
            .task {
                do{
                    newsPosts = try await getNewsPosts()
                    
                
                }catch NewsErrors.invalidResponse{
                    print("Error Invalid response")
                }catch NewsErrors.invalidData{
                    print("Error Invalid Data ")
                }catch NewsErrors.invalidURL{
                    print("Error invalid URL")
                }catch{
                    print("unexpected error")
                }
            }
        }
    }
    
}

#Preview {
    ContentView()
}
