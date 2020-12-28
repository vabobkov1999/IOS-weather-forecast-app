import UIKit

// api key e02a874fae6da1789a29b78bbb6610e4

class MainTemperatureController: UITableViewController {
    
    let imageStatusPicker = StatusImagePicker()
    
    @IBOutlet weak var statusImageView: UIImageView!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var mainTemperature: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    
    @IBOutlet weak var mainStatusLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    
    @IBOutlet weak var searchBarButton: UIBarButtonItem!
    @IBOutlet weak var addFavouriteButton: UIBarButtonItem!
    
    var cities = [City]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        setupLabels()
    }
    
    private func setup() {
        setupCity()
        setupNavController()
        setupLabels()
        setupTableView()
        setupButtons()
    }
    
    private func setupCity() {
        getCities()
        request(city: self.cities[0])
    }
    
    private func setupNavController() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
    }
    
    private func setupLabels() {
        cityLabel.textColor = UIColor.appColor(.text_black_bluewhite)
        feelsLikeLabel.textColor = UIColor.appColor(.text_black_bluewhite)
        mainTemperature.textColor = UIColor.appColor(.text_black_bluewhite)
        mainStatusLabel.textColor = UIColor.appColor(.text_black_bluewhite)
        humidityLabel.textColor = UIColor.appColor(.text_black_bluewhite)
        pressureLabel.textColor = UIColor.appColor(.text_black_bluewhite)
        minLabel.textColor = UIColor.appColor(.text_black_bluewhite)
        maxLabel.textColor = UIColor.appColor(.text_black_bluewhite)
        
    }
    
    private func setupTableView() {
        tableView.backgroundColor = UIColor.appColor(.background_white_nightblue)
    }
    
    private func setupButtons() {
        searchBarButton.tintColor = UIColor.appColor(.text_black_bluewhite)
        addFavouriteButton.tintColor = UIColor.appColor(.text_black_bluewhite)
        addFavouriteButton.image = #imageLiteral(resourceName: "favouriteWeather")
    }
    
    var temperature: Temperature!
    var weatherStatus: WeatherStatus!
    var currentCity: City!
    
    func request(city: City) {
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?id=\(city.id)&appid=e02a874fae6da1789a29b78bbb6610e4") else { return }
        let task = URLSession.shared.dataTask(with: url) { [self] (data, response, error) in
            
            if let data = data, error == nil {
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return }
                    guard let weatherTemp = json["main"] as? [String: Any] else { return }
                    
                    guard let weatherWeather = json["weather"] as? [[String: Any]] else { return }
                    
                    self.temperature = Temperature(dict: weatherTemp)
                    self.weatherStatus = WeatherStatus(dict: weatherWeather.first ?? [String: Any]())
                    self.currentCity = city
                    
                    
                    self.update(weatherTemp: self.temperature,
                                weatherStatus: self.weatherStatus,
                                city: self.currentCity)
                } catch {
                    print("Failed get weather")
                    presentAlert(title: "Ошибка погоды", message: "Возможно у вас нет интернета. Поэтому мы не можем показать Вам текущую погоду", actions: [UIAlertAction(title: "Хорошо", style: .default, handler: nil)])
                }
            } else {
                presentAlert(title: "Ошибка погоды", message: "Возможно у вас нет интернета. Поэтому мы не можем показать Вам текущую погоду", actions: [UIAlertAction(title: "Хорошо", style: .default, handler: nil)])
            }
        }
        task.resume()
    }
    
    func getCities() {
        guard let data = jsonCitiesData else { return }
        
        do {
            //            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            let cities = try JSONDecoder().decode([City].self, from: data)
            self.cities = cities
        } catch let jsonError {
            print(jsonError.localizedDescription)
        }
    }
    
    @IBAction func selectCityTapped(_ sender: Any) {
        let chooseCityVC = CitiesViewController()
        chooseCityVC.cities = self.cities
        chooseCityVC.delegate = self
        navigationController?.pushViewController(chooseCityVC, animated: true)
    }
    
    @IBAction func addFavouriteTapped(_ sender: Any) {
        if currentCity != nil && temperature != nil && weatherStatus != nil {
            let action1 = UIAlertAction(title: "Отмена", style: .default)
            let action2 = UIAlertAction(title: "Сохранить", style: .default) { (_) in
                
                CoreDataManager.shared.saveWeather(weatherTemp: self.temperature, weatherStatus: self.weatherStatus, city: self.currentCity)
                print(CoreDataManager.shared.getSavedWeathers())
                print()
            }
            presentAlert(title: "Сохранение погоды", message: "Вы хотите сохранить погоду в избранной категории?", actions: [action1, action2])
        } else {
            presentAlert(title: "Ошибка погоды", message: "Возможно у вас нет интернета. Поэтому мы не можем показать Вам текущую погоду", actions: [UIAlertAction(title: "Хорошо", style: .default, handler: nil)])
        }
    }
    
    
    func update(weatherTemp: Temperature, weatherStatus: WeatherStatus, city: City) {
        DispatchQueue.main.async { [self] in
            self.cityLabel.text = "\(city.name)"
            self.statusImageView.image = imageStatusPicker.getImageByWeatherStatus(status: weatherStatus.description)
            self.mainTemperature.text = "\(weatherTemp.temp)℃"
            self.feelsLikeLabel.text = "Feels like \(weatherTemp.feels_like)℃"
            self.mainStatusLabel.text = "\(weatherStatus.main): \(weatherStatus.description)"
            self.humidityLabel.text = "\(weatherTemp.humidity)% humidity"
            self.pressureLabel.text = "\(weatherTemp.pressure) mm. of merc."
            self.minLabel.text = "Min t°: \(weatherTemp.temp_min)℃"
            self.maxLabel.text = "Max t°:\(weatherTemp.temp_max)℃"
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        cell.isUserInteractionEnabled = false
        cell.contentView.backgroundColor = .clear
        cell.backgroundColor = .clear
    }
    
    private func presentAlert(title: String, message: String, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { (action) in
            alert.addAction(action)
        }
        present(alert, animated: true, completion: nil)
    }
}

extension MainTemperatureController: UpdateCityDelegate {
    func refetchCity(city: City) {
        request(city: city)
    }
}

