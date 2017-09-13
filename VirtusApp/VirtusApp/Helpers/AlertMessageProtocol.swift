//
//  AlertMessageProtocol.swift
//  VirtusApp
//
//  Created by Matheus Campos on 13/09/17.
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import UIKit

/// Protocol that shows an alert message.
protocol AlertMessageProtocol {}

extension AlertMessageProtocol {
    /**
     Shows an alert message.

     - Parameter controller: The parent controller to show the alert message.
     - Parameter title: The alert title.
     - Parameter message: The alert message.
    */
    func showAlertMessage(_ controller: UIViewController, title: String? = nil, message: String,
                          completion: @escaping (() -> Void)) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Fechar", style: .cancel, handler: { _ in
            completion()
        }))

        controller.present(alert, animated: true, completion: nil)
    }
}
