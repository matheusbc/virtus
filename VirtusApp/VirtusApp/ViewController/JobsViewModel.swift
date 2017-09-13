//
//  JobsViewModel.swift
//  VirtusApp
//
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import Foundation

/// The jobs ViewModel.
class JobsViewModel {
    // MARK: Properties
    /// The job list to be shown in the news screen.
    var jobsList: [Job] = []

    /// Class initializer.
    init() {
        // Mocked jobs. To get jobs from a server, comment the line below and get the news from the server.
        self.generateMockJobs()
    }

    /**
     The size of the jobs list.
     
     - Returns: An Int that represents the size of the jobs list.
     */
    func getListSize() -> Int {
        return jobsList.count
    }

    /**
     The job description of a certain row.
     
     - Parameter index: The row index.
     - Returns: A String with the job description.
     */
    func description(cellForRowAt index: Int) -> String {
        return jobsList[index].description
    }

    // MARK: Private methods
    /**
     Populates the job list with generated mocked data.
     
     **It should be removed after gets the jobs from the server.**
     */
    private func generateMockJobs() {
        jobsList = [
            Job(description: "Vaga para desenvolvedor Java Júnior"),
            Job(description: "Vaga para desenvolvedor Android Pleno"),
            Job(description: "Vaga para desenvolvedor iOS Senior")
        ]
    }
}
