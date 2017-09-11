//
//  NewsViewController.swift
//  VirtusApp
//
//  Created by Matheus Campos on 11/09/17.
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import UIKit

class NewsViewController: UITableViewController {
    // MARK: Outlets
    @IBOutlet var newsTableView: UITableView!

    // MARK: Properties
    // The news view model.
    let newsViewModel = NewsViewModel()

    override func viewDidLoad() {
        newsTableView.dataSource = self
    }
}

extension NewsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsViewModel.getListSize()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = createNewsCell()
        cell.newsDescription?.text = newsViewModel.description(cellForRowAt: indexPath.row)
        if let url = URL(string: newsViewModel.imageUrl(cellForRowAt: indexPath.row)) {
            if let data = try? Data(contentsOf: url) {
                cell.newsImage?.image = UIImage(data: data)
            }        
        }
        return cell
    }

    /// Create table view cell for associated child user.
    private func createNewsCell() -> NewsTableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell")
            as? NewsTableViewCell else {
                fatalError("Fail to cast to AssociatedUserTableViewCell")
        }
        
        return cell
    }
}

