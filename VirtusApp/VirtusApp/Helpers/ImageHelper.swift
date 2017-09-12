//
//  ImageHelper.swift
//  VirtusApp
//
//  Created by Matheus Campos on 12/09/17.
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import UIKit

class ImageHelper {
    static func loadImageFromUrl(url: String, view: UIImageView) {
        guard let url = URL(string: url) else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (responseData, responseUrl, error) -> Void in
            if let data = responseData {
                DispatchQueue.main.async(execute: { () -> Void in
                    view.image = UIImage(data: data)
                })
            }
        }

        task.resume()
    }
}
