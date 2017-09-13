//
//  News.swift
//  VirtusApp
//
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import Foundation

/// The news model.
struct News {
    // MARK: Properties
    /// The news image URL.
    let imageUrl: String
    /// The news text.
    let description: String
    /// The news date.
    let date: String
    /// The news local.
    let local: String

    /**
     Struct initializer.

     - Parameter description: The news text.
     - Parameter imageURL: The news image URL.
     - Parameter date: The news date.
     - Parameter local: The news local.
    */
    init(description: String, imageUrl: String, date: String, local: String) {
        self.description = description
        self.imageUrl = imageUrl
        self.date = date
        self.local = local
    }
}
