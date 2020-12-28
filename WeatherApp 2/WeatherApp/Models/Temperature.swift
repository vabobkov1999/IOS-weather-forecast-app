import Foundation

struct Temperature {
    var humidity: Double
    var pressure: Double
    var temp_max: Double
    var temp_min: Double
    var feels_like: Double
    var temp: Double
    
    init() {
        humidity = 0
        pressure = 0
        temp_max = 0
        temp_min = 0
        feels_like = 0
        temp = 0
    }
    
    init(dict: [String: Any]) {
        if let temp = dict["temp"] as? Double {
            self.temp = Temperature.roundTemp(num: temp)
        } else {
            self.temp = 0
        }
        
        if let feels_like = dict["feels_like"] as? Double {
            self.feels_like = Temperature.roundTemp(num: feels_like)
        } else {
            self.feels_like = 0
        }
        
        if let temp_min = dict["temp_min"] as? Double {
            self.temp_min = Temperature.roundTemp(num: temp_min)
        } else {
            self.temp_min = 0
        }
        
        if let temp_max = dict["temp_max"] as? Double {
            self.temp_max = Temperature.roundTemp(num: temp_max)
        } else {
            self.temp_max = 0
        }
        
        if let pressure = dict["pressure"] as? Double {
            self.pressure = pressure
        } else {
            self.pressure = 0
        }
        
        if let humidity = dict["humidity"] as? Double {
            self.humidity = humidity
        } else {
            self.humidity = 0
        }
    }
    
    static func roundTemp(num: Double) -> Double {
        return Double(round((num - 273) * 10) / 10)
    }
}
