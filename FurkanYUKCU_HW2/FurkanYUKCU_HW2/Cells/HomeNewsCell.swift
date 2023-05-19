//
//  HomeNewsCell.swift
//  FurkanYUKCU_HW2
//
//  Created by Furkan Yükcü on 18.05.2023.
//

import UIKit
import NewsAPI
import SDWebImage


class HomeNewsCell: UICollectionViewCell {
    
    @IBOutlet weak var newsImage: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var author: UILabel!
    
    var url:String?
    var abstract:String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let imageBorderWidth: CGFloat = 5
        let imageBorderColor = UIColor.systemGray5.cgColor
        newsImage.layer.borderWidth = imageBorderWidth
        newsImage.layer.borderColor = imageBorderColor
        
    }
    
    
    func configure(news: News) {
        title.text = news.title
        author.text = news.byline
        
        url = news.url
        abstract = news.abstract
        
        if let multimedia = news.multimedia.first, let urlString = multimedia.url, let url = URL(string: urlString) {
            newsImage.sd_setImage(with: url)
            
        }
    }
}

