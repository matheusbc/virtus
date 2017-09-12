//
//  VirtusSctructure.swift
//  VirtusApp
//
//  Created by Matheus Campos on 12/09/17.
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import Foundation

struct VirtusStructure {
    let imageName: String
    let imageDescription: String

    init(imageDescription: String, imageName: String) {
        self.imageDescription = imageDescription
        self.imageName = imageName
    }
}
