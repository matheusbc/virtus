//
//  VirtusSctructure.swift
//  VirtusApp
//
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import Foundation

/// The Virtus building strcuture model.
struct VirtusStructure {
    // MARK: Properties
    /// The building strcuture image name.
    let imageName: String
    /// The building strcuture description.
    let imageDescription: String

    /**
     Struct initializer.

     - Parameter imageDescription: The building strcuture description.
     - Parameter imageName: The building strcuture image name.
    */
    init(imageDescription: String, imageName: String) {
        self.imageDescription = imageDescription
        self.imageName = imageName
    }
}
