
import Foundation

func getUsers()async throws ->Users{
    
    let endpoint = "https://dummyjson.com/users"
    
    guard let url = URL(string:endpoint) else {
        throw UserError.invalidURL
    }
    
    let (data,response) = try await URLSession.shared.data(from: url)
    
    guard let response=response as? HTTPURLResponse ,response.statusCode == 200 else{
        
        throw UserError.invalidResponse
    }
    
    do{
        
        let decoder=JSONDecoder()
        return try decoder.decode(Users.self, from: data )
        
    }catch{
        
        throw UserError.invalidData
    }
}

enum UserError:Error{
    
    case invalidURL
    case invalidResponse
    case invalidData
}
