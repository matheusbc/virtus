//
//  Loadable.swift
//  VirtusApp
//
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import UIKit

/// Protocol that shows and hides a loading dialog.
protocol Loadable {}

extension Loadable {
    /**
     Shows a loading dialog.

     - Parameter controller: The parent controller to show the loading dialog.
     - Returns: The loading dialog.
    */
    func showLoading(_ controller: UIViewController) -> UIAlertController {
        return self.showLoading(controller, completion: nil)
    }

    /**
     Shows a loading dialog.
     
     - Parameter controller: The parent controller to show the loading dialog.
     - Returns: The loading dialog.
     */
    func showLoading(_ controller: UIViewController, completion: (() -> Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: nil, message: "Carregando...", preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        loadingIndicator.startAnimating()

        alert.view.addSubview(loadingIndicator)
        controller.present(alert, animated: true, completion: completion)

        return alert
    }

    /**
     Hides a loading dialog.
     
     - Parameter dialog: The loading dialog to be dismissed.
     */
    func dismissLoading(_ dialog: UIAlertController?) {
        guard let dialog = dialog else {
            return
        }
        dialog.dismiss(animated: true, completion: nil)
    }

    /**
     Hides a loading dialog.
     
     - Parameter dialog: The loading dialog to be dismissed.
     */
    func dismissLoading(_ dialog: UIAlertController?, closure: (() -> Void)?) {
        guard let dialog = dialog else {
            return
        }
        dialog.dismiss(animated: true, completion: closure)
    }
}
