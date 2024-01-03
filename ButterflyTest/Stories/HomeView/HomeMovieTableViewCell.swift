//
//  HomeMovieTableViewCell.swift
//  ButterflyTest
//
//  Created by muhammad.afroz on 02/01/2024.
//

import UIKit
import Kingfisher

class HomeMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescp: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupData(movie: HomeMovieModel) {
        lblDescp.text = movie.descp
        lblTitle.text = movie.title
        lblReleaseDate.text = "Release date: \(movie.releaseDate ?? "")"
        
        guard let url = movie.imageURL else {return}
        imgMovie.loadImage(from: url)
    }
    
}
