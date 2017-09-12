//
//  News.swift
//  VirtusApp
//
//  Created by Matheus Campos on 11/09/17.
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import Foundation

struct News {
    let imageUrl: String
    let description: String

    init(description: String, imageUrl: String) {
        self.description = description
        self.imageUrl = imageUrl
    }
}
