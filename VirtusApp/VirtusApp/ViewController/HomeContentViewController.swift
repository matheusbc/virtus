//
//  HomeContentViewController.swift
//  VirtusApp
//
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import UIKit

/// The home page content ViewController.
class HomeContentViewController: UIViewController {
    // MARK: Outlets
    /// The page content image view.
    @IBOutlet weak var image: UIImageView!
    /// The page content image description label.
    @IBOutlet weak var imageDescription: UILabel!

    // MARK: Properties
    /// The Virtus building structure ViewModel.
    let virtusStructureViewModel = VirtusStructureViewModel()
    var pageIndex: Int = 0
    var imageTitle = ""
    var imageName = ""

    override func viewDidLoad() {
        self.setImage()
        self.setImageDescription()
    }

    /**
     Sets the image view from the image name.
    */
    func setImage() {
        self.image.image = UIImage(named: self.imageName)
    }

    /**
     Sets the image description label with the imageTitle.
    */
    func setImageDescription() {
        self.imageDescription.text = self.imageTitle
    }
}
