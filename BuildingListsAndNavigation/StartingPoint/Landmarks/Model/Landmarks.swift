
import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Codable,Hashable,Identifiable {
    var name, category, city, state: String
    var id: Int
    var isFeatured, isFavorite: Bool
    var park: String
    var coordinates: Coordinates
    var description: String
    
    private var imageName: String
    
    var image: Image {
        Image(imageName)
    }
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Codable , Hashable {
        let longitude, latitude: Double
    }
}



