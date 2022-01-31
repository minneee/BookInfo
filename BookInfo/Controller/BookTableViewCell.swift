//
//  BookTableViewCell.swift
//  BookInfo
//
//  Created by mini on 2022/01/31.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var cellBookImageView: UIImageView!
    
    @IBOutlet weak var cellTitleLabel: UILabel!
    
    @IBOutlet weak var cellPriceLabel: UILabel!
    
    @IBOutlet weak var cellDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
