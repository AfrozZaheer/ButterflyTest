//
//  UIImageViewExtension.swift
//  ButterflyTest
//
//  Created by muhammad.afroz on 02/01/2024.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    func loadImage(from url: URL, placeHolderImage: UIImage? = nil) {
        let modifier = AnyModifier { request in
            var r = request
            r.setValue("Bearer \(Constants.PrivateKeys.TMDBApiReadAccessToken.rawValue)", forHTTPHeaderField: "Authorization")
            
            return r
        }
        self.kf.setImage(with: url, placeholder: placeHolderImage, options: [.requestModifier(modifier), .forceRefresh])
    }
}
