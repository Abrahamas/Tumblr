//
//  PhotoDetailsViewController.swift
//  Tumblr
//
//  Created by Mac on 6/25/1397 AP.
//  Copyright © 1397 Abraham Asmile. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {
  
    @IBOutlet weak var imageView: UIImageView!
    var imageURlS = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let urles = URL(string: imageURlS)!
        imageView.af_setImage(withURL: urles)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
