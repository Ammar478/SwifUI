

import Foundation

func getNewsPosts()async throws ->NewsItems{
    
    let endpoint = "https://hn.algolia.com/api/v1/search?tags=front_page"
    
    guard let url = URL(string: endpoint) else {
        throw NewsErrors.invalidURL
    }
    
    let (data,response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse , response.statusCode == 200 else {
        throw NewsErrors.invalidResponse
    }
  
    
    do{
        let decoder = JSONDecoder()
        print("here Decoder")

        print("status\(try decoder.decode(NewsItems.self, from: data))")
       return try decoder.decode(NewsItems.self, from: data)
      
    }catch{
        throw NewsErrors.invalidData
    }
}
