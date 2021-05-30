//
//  RepositoryCell.swift
//  bitbucketrepositories
//
//  Created by Ezaden Seraj on 30/5/21.
//

import UIKit

class RepositoryCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let avatar: ImageView = {
        let image = ImageView()
        image.clipsToBounds = true
        return image
    }()
    
    func setupView() {
        addSubview(avatar)
        avatar.anchor(top: topAnchor,
                      leading: leadingAnchor,
                      bottom: nil,
                      trailing: nil,
                      padding: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 0),
                      size: CGSize(width: 60, height: 60))
    }
}
