//
//  BaseViewController.swift
//  bitbucketrepositories
//
//  Created by Ezaden Seraj on 30/5/21.
//

import UIKit

class BaseViewController<View: BaseView>: UIViewController {
    
    override func loadView() {
        view = View()
    }
    
    var customView: View {
        return view as! View
    }
}
