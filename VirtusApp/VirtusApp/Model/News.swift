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

    /**
     Struct initializer.

     - Parameter description: The news text.
     - Parameter imageURL: The news image URL.
    */
    init(description: String, imageUrl: String) {
        self.description = description
        self.imageUrl = imageUrl
    }
}
