//
//  ViewController.swift
//  bitbucketrepositories
//
//  Created by Ezaden Seraj on 30/5/21.
//

import UIKit

fileprivate typealias RepositoriesDatasource = UITableViewDiffableDataSource<RepositoriesListViewController.Section, Repository>
fileprivate typealias RepositoriesSnapshot = NSDiffableDataSourceSnapshot<RepositoriesListViewController.Section, Repository>

class RepositoriesListViewController: BaseViewController<RepositoriesListView> {
    private var datasource: RepositoriesDatasource!
    
    let viewModel: RepositoriesViewModel
    
    init(with viewModel: RepositoriesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureDatasource()
        fetchData()
    }
    
    private func configureTableView() {
        self.customView.tableview.register(RepositoryCell.self, forCellReuseIdentifier: RepositoryCell.identifier)
        self.customView.tableview.delegate = self
    }
    
    private func configureDatasource() {
        datasource = RepositoriesDatasource(tableView: self.customView.tableview) { tableview, indexPath, repo -> RepositoryCell? in
            let cell = tableview.dequeueReusableCell(withIdentifier: RepositoryCell.identifier, for: indexPath) as! RepositoryCell
            return cell
        }
    }
    
    private func createSnapshot() {
        if let repositories = viewModel.repositories {
            var snapshot = RepositoriesSnapshot()
            snapshot.appendSections([.main])
            snapshot.appendItems(repositories)
            datasource.apply(snapshot, animatingDifferences: true)
        }
    }
    
    private func fetchData() {
        viewModel.getRepositories { [weak self] error in
            guard let self = self else {
                return
            }
            
            if let error = error {
                print(error)
            } else {
                self.createSnapshot()
            }
        }
    }
}

extension RepositoriesListViewController: UITableViewDelegate {
    enum Section {
        case main
    }
}


