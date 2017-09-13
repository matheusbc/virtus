//
//  NewsDetailsViewModel.swift
//  VirtusApp
//
//  Created by Matheus Campos on 13/09/17.
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import Foundation

/// The news ViewModel.
class NewsDetailsViewModel {
    // MARK: Properties
    /// The news to be shown in the news details screen.
    var news: News

    /**
     Class initializer.

     - Parameter news: The news to be shown.
    */
    init(news: News) {
        self.news = news
    }

    /**
     Class initializer.
     */
    init() {
        self.news = News(description: "", imageUrl: "")
    }

    /**
     The news description of a certain row.

     - Returns: A String with the news description.
     */
    func description() -> String {
        return news.description
    }

    /**
     The news image URL of a certain row.

     - Returns: A String with the news image URL.
     */
    func imageUrl() -> String {
        return news.imageUrl
    }

    // MARK: Private methods
}
