//
//  NewsViewModel.swift
//  VirtusApp
//
//  Created by Matheus Campos on 11/09/17.
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import Foundation

class NewsViewModel {

    func getListSize() -> Int {
        return 3
    }

    func description(cellForRowAt index: Int) -> String {
        return "Teste"
    }

    func imageUrl(cellForRowAt index: Int) -> String {
        return "http://www.iconesbr.net/iconesbr/2009/05/8325/8325_256x256.png"
    }
}
