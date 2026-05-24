//
//  PhotoDetailsViewController.swift
//  Tumblr
//
//  Created by Gerard Recinto on 11/18/17.
//  Copyright © 2017 Gerard Recinto. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {

  @IBOutlet weak var detailsImageView: UIImageView!
  var urlPhoto: String!
  var image: UIImage!

  override func viewDidLoad() {
        super.viewDidLoad()
    detailsImageView.image = image
        // Do any additional setup after loading the view.
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
