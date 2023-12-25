//
//  NewsMangers.swift
//  h4xor-news-2
//
//  Created by Ammar Ahmed on 11/06/1445 AH.
//

import Foundation

struct NewsItems:Codable {
    let hits: [Hit]
}

struct Hit:Hashable,Codable {
    
    let author, objectID: String
    let points: Int
    let title: String
    let url: String
}



enum NewsErrors:Error{
    case invalidURL
    case invalidResponse
    case invalidData
}
