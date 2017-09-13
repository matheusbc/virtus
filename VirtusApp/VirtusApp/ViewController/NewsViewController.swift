//
//  NewsViewController.swift
//  VirtusApp
//
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import UIKit

class NewsViewController: UITableViewController {
    // MARK: Properties
    // The news view model.
    let newsViewModel = NewsViewModel()

    override func viewDidLoad() {
        tableView.tableFooterView = UIView()
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

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let newsDetails = self.storyboard?.instantiateViewController(withIdentifier: "NewsDetailsViewController") as! NewsDetailsViewController
        newsDetails.newsDetailsViewModel = NewsDetailsViewModel(news: newsViewModel.news(cellForRowAt: indexPath.row))
        navigationController?.pushViewController(newsDetails, animated: true)
    }

    // MARK: Private methods
    /// Create table view cell for news.
    private func createNewsCell(cellForRowAt indexPath: IndexPath) -> NewsTableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath)
            as? NewsTableViewCell else {
                fatalError("Fail to cast to AssociatedUserTableViewCell")
        }

        return cell
    }
}
