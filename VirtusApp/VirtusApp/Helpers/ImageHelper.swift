//
//  ImageHelper.swift
//  VirtusApp
//
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import UIKit

/// Class that handle images.
class ImageHelper {
    /**
     Loads an image from a URL and sets to an UIImageView.

     - Parameter url:   The image URL.
     - Parameter view:  The UIImageView to be where the image will be loaded.
    */
    static func loadImageFromUrl(url: String, view: UIImageView) {
        guard let url = URL(string: url) else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (responseData, _, _) -> Void in
            if let data = responseData {
                DispatchQueue.main.async(execute: { () -> Void in
                    view.image = UIImage(data: data)
                })
            }
        }

        task.resume()
    }
}
