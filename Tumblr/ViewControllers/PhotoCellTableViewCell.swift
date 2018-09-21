//
//  PhotoCellTableViewCell.swift
//  Tumblr
//
//  Created by Mac on 6/24/1397 AP.
//  Copyright © 1397 Abraham Asmile. All rights reserved.
//

import UIKit

class PhotoCellTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
