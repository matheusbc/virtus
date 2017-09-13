//
//  Job.swift
//  VirtusApp
//
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import Foundation

/// The job model.
struct Job {
    // MARK: Properties
    /// The job description.
    let description: String

    /**
     Struct initializer.
     
     - Parameter description: The job description.
     */
    init(description: String) {
        self.description = description
    }
}
