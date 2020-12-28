import UIKit
import CoreData
import Firebase

class SavedCityController: UIViewController {
    let imageStatusPicker = StatusImagePicker()
    
    @IBOutlet weak var tableView: UITableView!
    
    var weathers: [Weather]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadWeathers()
    }
    
    private func reloadWeathers() {
        weathers = CoreDataManager.shared.getSavedWeathers()
        tableView.reloadData()
    }
    
    private func setup() {
        setupView()
        setupTableView()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor.appColor(.background_white_nightblue)
        tableView.backgroundColor = UIColor.appColor(.background_white_nightblue)
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "WeatherViewCell", bundle: nil), forCellReuseIdentifier: "WeatherViewCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
        CoreDataManager.shared.deleteAllWeathers()
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SavedCityController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherViewCell") as! WeatherViewCell
        let index = indexPath.row
        let curWeather = weathers[index]
        cell.backgroundColor = .clear
        if let img = cell.weatherTagImageView {
            img.image = imageStatusPicker.getImageByWeatherStatus(status: curWeather.description) ?? #imageLiteral(resourceName: "clouds")
        }
        if let temp = cell.temperatureLabel {
            temp.text = "\(curWeather.temperature)℃"
        }
        if let dat = cell.dateLabel {
            let date = curWeather.date
            let formatter = DateFormatter()
            formatter.timeStyle = .medium
            formatter.dateStyle = .short
//            formatter.string(from: date ?? Date())
            dat.text = "\(formatter.string(from: date ?? Date()))"
        }
        if let cit = cell.cityLabel {
            cit.text = "\(curWeather.city ?? "Default")"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let index = indexPath.row
        let toDeleteWeather = weathers[index]
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, _) in
            
            CoreDataManager.shared.deleteWeather(weather: toDeleteWeather)
            self.reloadWeathers()
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
}
