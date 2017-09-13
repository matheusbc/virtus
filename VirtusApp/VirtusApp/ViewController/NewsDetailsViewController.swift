//
//  NewsDetailsViewController.swift
//  VirtusApp
//
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import UIKit

/// The news details ViewController.
class NewsDetailsViewController: UIViewController, Loadable {
    // MARK: Outlets
    /// The news image view.
    @IBOutlet weak var newsImage: UIImageView!
    /// The news text view.
    @IBOutlet weak var newsText: UITextView!
    /// The news date label.
    @IBOutlet weak var date: UILabel!
    /// The news local label.
    @IBOutlet weak var local: UILabel!

    // MARK: Properties
    /// The news details ViewModel.
    var newsDetailsViewModel = NewsDetailsViewModel()
    /// The loading dialog.
    var loading: UIAlertController?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.loading = self.showLoading(self) {
            self.loadNewsContent()
            self.dismissLoading(self.loading)
        }
    }

    // MARK: Private methods
    /**
     Loads the news information to the view.
    */
    private func loadNewsContent() {
        self.newsText.text = self.newsDetailsViewModel.description()
        ImageHelper.loadImageFromUrl(url: self.newsDetailsViewModel.imageUrl(), view: self.newsImage)
        self.date.text = self.newsDetailsViewModel.date()
        self.local.text = self.newsDetailsViewModel.local()
    }
}
