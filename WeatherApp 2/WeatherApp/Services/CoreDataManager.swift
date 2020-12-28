import Foundation
import CoreData

struct CoreDataManager {
    static let shared = CoreDataManager()
    
    private let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "WeatherApp")
        container.loadPersistentStores { (description, error) in
            if let err = error {
                fatalError("Loading data bases failed: \(err)")
            }
        }
        return container
    }()
    
    internal var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func getSavedWeathers() -> [Weather] {
        let context = self.viewContext
        let fetchRequest = NSFetchRequest<Weather>(entityName: "Weather")
        var savedWeathers = [Weather]()
        
        do {
            savedWeathers = try context.fetch(fetchRequest)
            
            savedWeathers.forEach { (wthr) in
                print("\(wthr.city) \(wthr.temperature) \(wthr.humidity) \(wthr.pressure) \(wthr.date) \n")
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
        return savedWeathers
    }
    
    func saveWeather(weatherTemp: Temperature, weatherStatus: WeatherStatus, city: City) {
        let context = self.viewContext
        
        var isNeedToSave: Bool = true
        
        let saved = self.getSavedWeathers()
        saved.forEach { (weather) in
            if (weather.city == city.name && weather.temperature == weatherTemp.temp && weather.humidity == weatherTemp.humidity) {
                isNeedToSave = false
            }
        }
        
        if isNeedToSave == true {
            let weatherEntity = NSEntityDescription.insertNewObject(forEntityName: "Weather",
                                                                    into: context)
            weatherEntity.setValue(city.name, forKey: "city")
            weatherEntity.setValue(Date(), forKey: "date")
            weatherEntity.setValue(weatherTemp.feels_like, forKey: "feelsT")
            weatherEntity.setValue(weatherTemp.humidity, forKey: "humidity")
            weatherEntity.setValue(weatherTemp.temp_max, forKey: "maxT")
            weatherEntity.setValue(weatherTemp.temp_min, forKey: "minT")
            weatherEntity.setValue(weatherTemp.pressure, forKey: "pressure")
            weatherEntity.setValue(weatherStatus.description, forKey: "tag")
            weatherEntity.setValue(weatherTemp.temp, forKey: "temperature")
            
            do {
                try context.save()
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteWeather(weatherTemp: Temperature, weatherStatus: WeatherStatus, city: City) {
        let context = self.viewContext
        let fetchRequest = NSFetchRequest<Weather>(entityName: "Weather")
        var savedWeathers = [Weather]()
        
        do {
            savedWeathers = try context.fetch(fetchRequest)
        } catch let error {
            print(error.localizedDescription)
        }
        
        savedWeathers.forEach { (weather) in
            if (weather.city == city.name && weather.temperature == weatherTemp.temp && weather.humidity == weatherTemp.humidity && weather.pressure == weatherTemp.pressure && weather.tag == weatherStatus.description) {
                context.delete(weather)
            }
        }
        
        do {
            try context.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func deleteWeather(weather: Weather) {
        let context = self.viewContext
        
        context.delete(weather)
        
        do {
            try context.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func deleteAllWeathers() {
        let context = self.viewContext
        let fetchRequest = NSFetchRequest<Weather>(entityName: "Weather")
        var savedWeathers = [Weather]()
        
        do {
            savedWeathers = try context.fetch(fetchRequest)
        } catch let error {
            print(error.localizedDescription)
        }
        
        savedWeathers.forEach {
            context.delete($0)
        }
        
        do {
            try context.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
