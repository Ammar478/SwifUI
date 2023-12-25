//
//  newsCard.swift
//  h4xor-news-2
//
//  Created by Ammar Ahmed on 11/06/1445 AH.
//

import SwiftUI

struct NewsCard: View {
    var newsPost:Hit?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center, spacing: 0.0) {
                Text(newsPost?.title ?? "Title").font(.title).bold()
                Text(newsPost?.url ?? "URL").foregroundColor(.secondary)
            }
            HStack(){
                Text(String(newsPost?.points ?? 0) ).foregroundColor(.secondary)
                Text("\(newsPost?.author ?? "Auther") comments").foregroundColor(.secondary)

            }
            
        }
    }
}

#Preview {
    NewsCard().previewLayout(.sizeThatFits)
}

