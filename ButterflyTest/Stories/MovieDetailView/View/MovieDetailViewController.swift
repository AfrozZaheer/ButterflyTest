//
//  MovieDetailViewController.swift
//  ButterflyTest
//
//  Created by muhammad.afroz on 03/01/2024.
//

import UIKit

class MovieDetailViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var imgBackDrop: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescp: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!

    //MARK: - Properties
    
    var presenter: MovieDetailViewToPresenterProtocol!
    
    //MARK: - ControllerFlow
    static func initializeViewControllerInstance() -> MovieDetailViewController {
        let controller = MovieDetailViewController(nibName: "MovieDetailViewController", bundle: nil)
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter.viewDidLoad()
    }
    
    private func setup() {
        self.title = "Movie"
    }
}

extension MovieDetailViewController: MovieDetailPresenterToViewProtocol {
    func fetchedData(movie: MovieDetailModel) {
        if let url = movie.imageURL {
            imgPoster.loadImage(from: url)
        }
        if let url = movie.backDropImageURL {
            imgBackDrop.loadImage(from: url)
        }
        lblTitle.text = movie.title
        lblDescp.text = movie.descp
        lblReleaseDate.text = "Release date: \(movie.releseDate ?? "-")"
    }
    
    func showError(error: Error) {
    }
}
