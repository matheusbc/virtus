//
//  JobApplicationViewController.swift
//  VirtusApp
//
//  Created by Matheus Campos on 13/09/17.
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import UIKit

class JobApplicationViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var job: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var linkedinUrl: UITextField!

    // MARK: Properties
    var jobName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavigationBar()
        self.setupForm()
    }

    func sendCurriculum() {
        // TODO: Show loading, show success message and go back.
        navigationController?.popViewController(animated: true)
    }

    // MARK: Private methods
    private func setupNavigationBar() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Enviar", style: .plain, target: self, action: #selector(JobApplicationViewController.sendCurriculum))
    }

    private func setupForm() {
        self.job.text = self.jobName
    }
}
