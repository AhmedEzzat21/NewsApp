//
//  NewsCell.swift
//  NewsApp
//
//  Created by Ahmed on 18/06/2021.
//

import UIKit
import moa

class NewsCell: UICollectionViewCell {
    var itemIndex: Int = 0
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
     func configure(result: Article, index: Int) {
        self.itemIndex = index
        img.moa.url = result.urlToImage
        title.text = result.title

     }

  
}
