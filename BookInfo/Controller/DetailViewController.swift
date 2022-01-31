//
//  DetailViewController.swift
//  BookInfo
//
//  Created by mini on 2022/01/31.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var receiveImage: UIImage?
    var receiveTitle = ""
    var receivePrice = ""
    var receiveDescription = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        coverImageView.image = receiveImage
        titleLabel.text = receiveTitle
        priceLabel.text = receivePrice
        descriptionLabel.text = receiveDescription
    
    }
    

}
