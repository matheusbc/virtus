//
//  VirtusStructureViewModel.swift
//  VirtusApp
//
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import UIKit

/// The ViewModel for Virtus building structure.
class VirtusStructureViewModel {
    // MARK: Properties
    /// The Virtus building structures list.
    var virtusStructures: [VirtusStructure] = []

    init() {
        generateMockVirtusStructures()
    }

    /**
     The image name of the building structure for a row.

     - Parameter index: The row index.
     - Returns: A String with the image name.
    */
    func imageName(forIndex index: Int) -> String {
        return self.virtusStructures[index].imageName
    }

    /**
     The image descrition of the building structure for a row.
     
     - Parameter index: The row index.
     - Returns: A String with the image description.
     */
    func imageDescription(forIndex index: Int) -> String {
        return self.virtusStructures[index].imageDescription
    }

    /**
     Size of the Virtus building structures list.

     - Returns: An Int with the Virtus building structures list.
    */
    func count() -> Int {
        return self.virtusStructures.count
    }

    // MARK: Private methods
    /**
     Populates the Virtus building structures list with mocked data.

     **It should be removed after gets the news from the server.**
    */
    private func generateMockVirtusStructures() {
        virtusStructures.append(VirtusStructure(imageDescription: "Visão externa do Virtus", imageName: "virtus_ext"))
        virtusStructures.append(VirtusStructure(imageDescription: "Sala de trabalho", imageName: "virtus_workspace"))
        virtusStructures.append(VirtusStructure(imageDescription: "Sala de reunião", imageName: "virtus_meeting"))
    }
}
