//
//  BaseView.swift
//  bitbucketrepositories
//
//  Created by Ezaden Seraj on 30/5/21.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setViews()
        layoutViews()
    }
    
    func setViews() {
        backgroundColor = .white
    }
    
    func layoutViews() {}
    
}
