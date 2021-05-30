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
    
    let displayNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 18)
        label.textAlignment = .left
        label.textColor = UIColor.black
        return label
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 18)
        label.textAlignment = .left
        label.textColor = UIColor.black
        return label
    }()
    
    let dateOfCreationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 18)
        label.textAlignment = .left
        label.textColor = UIColor.black
        return label
    }()
    
    func setupView() {
        addSubview(avatar)
        addSubview(displayNameLabel)
        addSubview(dateOfCreationLabel)
        addSubview(typeLabel)

        avatar.anchor(top: topAnchor,
                      leading: leadingAnchor,
                      bottom: nil,
                      trailing: nil,
                      padding: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 0),
                      size: CGSize(width: 60, height: 60))
        
        displayNameLabel.anchor(top: topAnchor,
                                leading: avatar.trailingAnchor,
                                bottom: nil,
                                trailing: trailingAnchor,
                                padding: UIEdgeInsets(top: 16, left: 12, bottom: 5, right: 5),
                                size: CGSize(width: 0, height: 0))
        
        dateOfCreationLabel.anchor(top: avatar.bottomAnchor,
                                   leading: avatar.leadingAnchor,
                                   bottom: bottomAnchor,
                                   trailing: nil,
                                   padding: UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0),
                                   size: CGSize(width: 0, height: 0))
        
        typeLabel.anchor(top: dateOfCreationLabel.topAnchor,
                         leading: dateOfCreationLabel.trailingAnchor,
                         bottom: bottomAnchor,
                         trailing: trailingAnchor,
                         padding: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 16),
                         size: CGSize(width: 0, height: 0))
    }
    
    func setupUI(with repository: Repository) {
        self.avatar.load(from: repository.owner.links.avatar.href, with: .scaleAspectFit)
        self.displayNameLabel.text = repository.owner.displayName
        self.dateOfCreationLabel.text = repository.createdDate
        self.typeLabel.text = repository.type
    }
    
    override func layoutSubviews() {
        avatar.layer.cornerRadius = avatar.bounds.width / 2
    }
}
