import Foundation

struct City: Codable {
    let id: Int
    let name, state, country: String
    let coord: Coord
    
    init() {
        id = 0
        name = ""
        state = ""
        country = ""
        coord = Coord()
    }
}

// MARK: - Coord
struct Coord: Codable {
    init() {
        lon = 0
        lat = 0
    }
    let lon, lat: Double
}
