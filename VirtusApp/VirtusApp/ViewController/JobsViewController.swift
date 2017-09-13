//
//  JobsViewController.swift
//  VirtusApp
//
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import UIKit

class JobsViewController: UITableViewController {
    // MARK: Properties
    // The news view model.
    let jobsViewModel = JobsViewModel()

    override func viewDidLoad() {
        tableView.tableFooterView = UIView()
    }
}

extension JobsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobsViewModel.getListSize()
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Vagas"
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = createJobCell(cellForRowAt: indexPath)
        cell.textLabel?.text = jobsViewModel.description(cellForRowAt: indexPath.row)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let jobApplication = self.storyboard?.instantiateViewController(withIdentifier: "JobApplicationViewController") as! JobApplicationViewController
        jobApplication.jobName = jobsViewModel.description(cellForRowAt: indexPath.row)
        navigationController?.pushViewController(jobApplication, animated: true)
    }

    // MARK: Private methods
    /// Create table view cell for job.
    private func createJobCell(cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "JobCell", for: indexPath)
    }
}
