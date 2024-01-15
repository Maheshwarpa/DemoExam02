//
//  PropertyCell.swift
//  MaheshwarRealEstateApp
//
//  Created by Maheshwar Punyam Anand on 1/14/24.
//

import UIKit

class PropertyCell: UITableViewCell {

    
    @IBOutlet weak var imageIV: UIImageView!
    @IBOutlet weak var textLBL: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
