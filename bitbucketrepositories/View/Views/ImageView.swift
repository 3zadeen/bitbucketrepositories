//
//  ImageView.swift
//  bitbucketrepositories
//
//  Created by Ezaden Seraj on 30/5/21.
//

import UIKit

class ImageView: UIImageView {
    let cachedImage = NSCache<NSString, UIImage>()
    
    func load(from stringURL: String, with contentMode: UIView.ContentMode) {
        if let cachedImage = cachedImage.object(forKey: stringURL as NSString) {
            self.image = cachedImage
            self.contentMode =  contentMode
            
            return
        }
        
        guard let url = URL(string: stringURL) else {
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            guard let self = self else {
                return
            }

            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.cachedImage.setObject(image, forKey: stringURL as NSString)
                        self.image = image
                    }
                }
            } else {
                self.cachedImage.setObject(UIImage(), forKey: stringURL as NSString)
            }
        }
    }
}
