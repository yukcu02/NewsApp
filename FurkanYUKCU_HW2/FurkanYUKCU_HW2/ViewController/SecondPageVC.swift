//
//  SecondPageVC.swift
//  FurkanYUKCU_HW2
//
//  Created by Furkan Yükcü on 19.05.2023.
//

import UIKit
import NewsAPI
import SafariServices

class SecondPageVC: UIViewController {
    
    @IBOutlet weak var newsImageLabel: UIImageView!
    
    @IBOutlet weak var titleLabel2: UILabel!
    
    @IBOutlet weak var descriptionLabel2: UILabel!
    
    @IBOutlet weak var authorLabel2: UILabel!
        
    
    var authorLabel2Text: String = ""
      var titleLabel2Text: String = ""
      var newsImageLabelData: [Multimedia] = []
      var descriptionLabel2Text: String = ""
      var url: String = ""
      
      override func viewDidLoad() {
          super.viewDidLoad()
          
          // Set the labels' text and load the image
          authorLabel2.text = authorLabel2Text
          titleLabel2.text = titleLabel2Text
          descriptionLabel2.text = descriptionLabel2Text
          loadImage()
      }
      
    private func loadImage() {
        // Load the image using the first multimedia item (if available)
        if let firstMultimedia = newsImageLabelData.first, let imageUrlString = firstMultimedia.url, let imageUrl = URL(string: imageUrlString) {
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: imageUrl), let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.newsImageLabel.image = image
                    }
                }
            }
        }
    }


    
    @IBAction func safariButton(_ sender: Any) {
        if let url = URL(string: self.url) {
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        }
        
        
    }
}
