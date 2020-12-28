import Foundation

struct WeatherStatus {
    var id: Int
    var description: String
    var main: String
    
    init() {
        id = 1
        description = ""
        main = ""
    }
    
    init(dict: [String: Any]) {
        if let id = dict["id"] as? Int {
            self.id = id
        } else {
            self.id = 0
        }
        
        if let description = dict["description"] as? String {
            self.description = description
        } else {
            self.description = "Clear sky"
        }
        
        if let main = dict["main"] as? String {
            self.main = main
        } else {
            self.main = "Clear"
        }
    }
}
