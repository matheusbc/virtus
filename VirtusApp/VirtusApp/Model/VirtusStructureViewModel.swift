//
//  VirtusStructureViewModel.swift
//  VirtusApp
//
//  Created by Matheus Campos on 12/09/17.
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import UIKit

class VirtusStructureViewModel {
    var virtusStructures: [VirtusStructure] = []

    init() {
        loadVirtusStructures()
    }

    private func loadVirtusStructures() {
        virtusStructures.append(VirtusStructure(imageDescription: "Visão externa do Virtus", imageName: "virtus_ext"))
        virtusStructures.append(VirtusStructure(imageDescription: "Sala de trabalho", imageName: "virtus_workspace"))
        virtusStructures.append(VirtusStructure(imageDescription: "Sala de reunião", imageName: "virtus_meeting"))
    }

    func imageName(forIndex index: Int) -> String {
        return self.virtusStructures[index].imageName
    }

    func imageDescription(forIndex index: Int) -> String {
        return self.virtusStructures[index].imageDescription
    }

    func count() -> Int {
        return self.virtusStructures.count
    }
}
