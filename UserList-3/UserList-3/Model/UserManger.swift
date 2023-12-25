
import Foundation

struct Users:Codable,Hashable{
    let users:[User]
}

struct User: Codable,Hashable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let gender, email, phone, username: String
    let password, birthDate: String
    let image: String

    
    var fullName:String{
        return "\(firstName) \(maidenName) \(lastName)"
    }
}


struct Address: Codable,Hashable {
    let address, city: String
    let coordinates: Coordinates
    let postalCode, state: String
}


struct Coordinates: Codable,Hashable {
    let lat, lng: Double
}


struct Bank: Codable,Hashable {
    let cardExpire, cardNumber, cardType, currency: String
    let iban: String
}


struct Company: Codable,Hashable {
    let address: Address
    let department, name, title: String
}


struct Hair: Codable,Hashable {
    let color, type: String
}
