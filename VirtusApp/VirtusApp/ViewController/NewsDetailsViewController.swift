//
//  NewsDetailsViewController.swift
//  VirtusApp
//
//  Created by Matheus Campos on 12/09/17.
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsText: UITextView!

    // MARK: Properties
    var imageUrl: String = ""
    var newsContent: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        loadNewsContent()
    }

    // MARK: Private methods
    private func loadNewsContent() {
        self.newsText.text = self.newsContent
        ImageHelper.loadImageFromUrl(url: self.imageUrl, view: self.newsImage)
    }
}
