//
//  JobApplicationViewController.swift
//  VirtusApp
//
//  Created by Matheus Campos on 13/09/17.
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import UIKit

class JobApplicationViewController: UIViewController, Loadable, AlertMessageProtocol {
    // MARK: Outlets
    /// The job name text field.
    @IBOutlet weak var job: UITextField!
    /// The user name text field.
    @IBOutlet weak var name: UITextField!
    /// The linkedIn url text field.
    @IBOutlet weak var linkedinUrl: UITextField!

    // MARK: Properties
    /// The selected job name.
    var jobName: String = ""
    /// The loading dialog.
    var loading: UIAlertController?

    override func viewDidLoad() {
        super.viewDidLoad()

        loading = self.showLoading(self) {
            self.setupNavigationBar()
            self.setupForm()
            self.dismissLoading(self.loading)
        }
    }

    /**
     Sends the curriculum information.
    */
    func sendCurriculum() {
        let loading = self.showLoading(self)
        if checkForm() {
            // Simulates a time to send curriculum.
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
                self.dismissLoading(loading) {
                    self.showAlertMessage(self, title: "Sucesso", message: "Currículo enviado.", completion: {
                        self.navigationController?.popViewController(animated: true)
                    })
                }
            })
        } else {
            self.dismissLoading(loading) {
                self.showAlertMessage(self, title: "Erro", message: "Todos os campos são obrigatórios.", completion: {})
            }
        }
    }

    // MARK: Private methods
    /**
     Setup the navigation bar.
    */
    private func setupNavigationBar() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Enviar", style: .plain, target: self, action: #selector(JobApplicationViewController.sendCurriculum))
    }

    /**
     Setup the form fields.
    */
    private func setupForm() {
        self.job.text = self.jobName
    }

    /**
     Checks if all the fields have text.

     - Returns: True if all the fields of the form have text. False, otherwise.
    */
    private func checkForm() -> Bool {
        let hasName = self.name.hasText
        let hasLinkedinUrl = self.linkedinUrl.hasText
        return hasName && hasLinkedinUrl
    }
}
