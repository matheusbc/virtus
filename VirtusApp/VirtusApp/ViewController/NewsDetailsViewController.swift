//
//  NewsDetailsViewController.swift
//  VirtusApp
//
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import UIKit

/// The news details ViewController.
class NewsDetailsViewController: UIViewController {
    // MARK: Outlets
    /// The news image view.
    @IBOutlet weak var newsImage: UIImageView!
    /// The news text view.
    @IBOutlet weak var newsText: UITextView!

    // MARK: Properties
    // TODO: Remove the properties below and extract to a Model and ViewModel.
    var imageUrl: String = ""
    var newsContent: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        loadNewsContent()
    }

    // MARK: Private methods
    /**
     Loads the news information to the view.
    */
    private func loadNewsContent() {
        self.newsText.text = self.newsContent
        ImageHelper.loadImageFromUrl(url: self.imageUrl, view: self.newsImage)
    }
}
