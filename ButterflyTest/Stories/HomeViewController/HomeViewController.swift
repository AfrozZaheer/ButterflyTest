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
        presenter?.getAllMovies()
    }
    
    private func setup() {
        tableView.register(UINib(nibName: "HomeMovieTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeMovieTableViewCell")
    }
}

//MARK: - HomePresenterToViewProtocol
extension HomeViewController: HomePresenterToViewProtocol {
    func fetchedResults(movies: [HomeMovieModel]) {
        //self.update view
    }
    
    func showError(error: Error) {
        //self.showError
    }
}
//MARK: - HomePresenterToViewProtocol
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeMovies.count
    }
    
}

//MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.presenter?.searchForMovieName(txt: searchBar.text ?? "")
    }
}
