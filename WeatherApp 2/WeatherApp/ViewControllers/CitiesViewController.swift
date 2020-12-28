import UIKit

protocol UpdateCityDelegate {
    func refetchCity(city: City)
}

class CitiesViewController: UITableViewController {
    // MARK:- Properties
    public var cities = [City]()
    public var delegate: UpdateCityDelegate!
    
    private var filteredCities = [City]()
    private var searchController = UISearchController(searchResultsController: nil)
    
    private var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }

    // MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        tableView.backgroundColor = UIColor.appColor(.background_white_nightblue)

        setup()
    }
    
    // MARK:- ViewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK:- setup
    private func setup() {
        setupSearchController()
    }
    
    private func setupSearchController() {
            searchController.searchResultsUpdater = self
            searchController.obscuresBackgroundDuringPresentation = false
            searchController.searchBar.placeholder = "Select a city"
            navigationItem.searchController = searchController
            definesPresentationContext = true
        }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return isFiltering ? filteredCities.count: cities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! UITableViewCell

        cell.backgroundColor = .clear
        let city = isFiltering ? filteredCities[indexPath.row]: cities[indexPath.row]
        cell.textLabel?.text = city.name
        cell.textLabel?.textColor = UIColor.appColor(.text_black_bluewhite)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = isFiltering ? filteredCities[indexPath.row]: cities[indexPath.row]
        delegate.refetchCity(city: city)
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:- Methods
    func filterContentForSearchText(_ searchText: String) {
        filteredCities = cities.filter({ (city) -> Bool in
            return city.name.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
}

// MARK:- UISearchResultsUpdating
extension CitiesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}
