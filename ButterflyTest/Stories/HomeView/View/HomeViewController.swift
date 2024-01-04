//
//  HomeViewController.swift
//  ButterflyTest
//
//  Created by Afroz Zaheer on 01/01/2024.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //MARK: - Properties
    var presenter: HomeViewToPresenterProtocol?
    private var homeMovies = [HomeMovieModel]()
    
    //MARK: - ControllerFlow
    static func initializeViewControllerInstance() -> HomeViewController {
        let controller = HomeViewController(nibName: "HomeViewController", bundle: nil)
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.getAllMovies(txt: searchBar.text)
    }
    
    private func setup() {
        tableView.register(UINib(nibName: "HomeMovieTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeMovieTableViewCell")
        self.title = "Home"
    }
}

//MARK: - HomePresenterToViewProtocol
extension HomeViewController: HomePresenterToViewProtocol {
    func fetchedResults(movies: [HomeMovieModel]) {
        //self.update view
        self.homeMovies = movies
        self.tableView.reloadData()
    }
    
    func showError(error: Error) {
        self.showErrorAlert(msg: error.localizedDescription)
    }
}
//MARK: - HomePresenterToViewProtocol
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeMovieTableViewCell") as? HomeMovieTableViewCell else {return UITableViewCell()}
        let data = homeMovies[indexPath.row]
        cell.setupData(movie: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeMovies.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.moveToMovieDetail(movie: homeMovies[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == homeMovies.count - 4 {
            //fetch next result
            presenter?.getNextMovies(txt: searchBar.text)
        }
    }
    
}

//MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        presenter?.getAllMovies(txt: searchBar.text)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
