//
//  SecondPageVC.swift
//  FurkanYUKCU_HW2
//
//  Created by Furkan Yükcü on 19.05.2023.
//

import UIKit

class SecondPageVC: UIViewController {
    
    @IBOutlet weak var newsImageLabel: UIImageView!
    
    @IBOutlet weak var titleLabel2: UILabel!
    
    @IBOutlet weak var descriptionLabel2: UILabel!
    
    @IBOutlet weak var authorLabel2: UILabel!
        
    
    var authorLable : String = ""
    var titleLable : String = ""
    var NewsImageLable : [Multimedia] = []
    var descriptionLable : String = ""
    var url : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }
    
    @IBAction func safariButton(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
