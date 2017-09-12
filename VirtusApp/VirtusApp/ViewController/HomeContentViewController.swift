//
//  HomeContentViewController.swift
//  VirtusApp
//
//  Created by Matheus Campos on 12/09/17.
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import UIKit

class HomeContentViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var imageDescription: UILabel!

    let virtusStructureViewModel = VirtusStructureViewModel()

    // MARK: Properties
    var pageIndex: Int = 0
    var imageTitle = ""
    var imageName = ""

    override func viewDidLoad() {
        self.setImage()
        self.setImageDescription()
    }

    func setImage() {
        self.image.image = UIImage(named: self.imageName)
    }

    func setImageDescription() {
        self.imageDescription.text = self.imageTitle
    }
}
