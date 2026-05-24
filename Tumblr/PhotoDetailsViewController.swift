//
//  PhotoDetailsViewController.swift
//  Tumblr
//
//  Created by Gerard Recinto on 11/18/17.
//  Copyright © 2017 Gerard Recinto. All rights reserved.
//

import UIKit

@MainActor
class PhotoDetailsViewController: UIViewController {

    @IBOutlet weak var detailsImageView: UIImageView!
    var urlPhoto: String?
    var image: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        detailsImageView.image = image
    }

}
