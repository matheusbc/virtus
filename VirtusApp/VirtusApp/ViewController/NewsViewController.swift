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
        let cell = createNewsCell(cellForRowAt: indexPath)
        cell.newsDescription?.text = newsViewModel.description(cellForRowAt: indexPath.row)
        ImageHelper.loadImageFromUrl(url: newsViewModel.imageUrl(cellForRowAt: indexPath.row), view: cell.newsImage)
        return cell
    }

    /// Create table view cell for associated child user.
    private func createNewsCell(cellForRowAt indexPath: IndexPath) -> NewsTableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath)
            as? NewsTableViewCell else {
                fatalError("Fail to cast to AssociatedUserTableViewCell")
        }
        
        return cell
    }
}
