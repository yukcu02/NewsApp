//
//  ViewController.swift
//  FurkanYUKCU_HW2
//
//  Created by Furkan Yükcü on 18.05.2023.
//

import UIKit
import NewsAPI

extension ViewController {
    fileprivate enum Constants {
        static let cellLeftPadding: CGFloat = 10
        static let cellRightPadding: CGFloat = 10
        static let cellPosterImageRatio: CGFloat = 1/2
        static let cellTitleHeight: CGFloat = 60
    }

}

final class ViewController: UIViewController, LoadingShowable {
    var authorLable : String = ""
    var titleLable : String = ""
    var NewsImageLable: [Multimedia] = []
    var descriptionLable : String = ""
    var url : String = ""
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let service: HomeNewsServiceProtocol = HomeNewsService()
    private var news: [News] = []
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchNews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let tasarim:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
               let genislik = self.collectionView.frame.size.width
               tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 40)
               tasarim.itemSize = CGSize(width: (genislik-55)/2, height: (genislik-55)/2)
               tasarim.minimumInteritemSpacing = 5
               tasarim.minimumLineSpacing = 5

               print("inside viewdidload")
               collectionView!.collectionViewLayout = tasarim
        // Do any additional setup after loading the view.
        collectionView.register(cellType: HomeNewsCell.self)
    }
    fileprivate func fetchNews(){

        self.showLoading()
        service.fetchHomeNews {[weak self] response in
            guard let self else {return}
            self.hideLoading()
            switch response {
            case .success(let news):
                print("FURKAN: \(news)")
                self.news = news
                self.collectionView.reloadData()
            case .failure(let error):
                print("FURKAN: \(error)")
            }
        }
    }
}
extension ViewController: UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeCell(cellType: HomeNewsCell.self, indexPath: indexPath)
        let news = self.news[indexPath.row]
        cell.configure(news: news)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Get the selected news
        let selectedNews = news[indexPath.row]
        
        // Instantiate SecondPageVC from storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondPageVC = storyboard.instantiateViewController(withIdentifier: "SecondPageVC") as? SecondPageVC else {
            return
        }
        
        // Pass the necessary data to SecondPageVC
        secondPageVC.authorLabel2Text = selectedNews.byline ?? ""
        secondPageVC.titleLabel2Text = selectedNews.title ?? ""
        secondPageVC.newsImageLabelData = selectedNews.multimedia
        secondPageVC.descriptionLabel2Text = selectedNews.abstract ?? ""
        secondPageVC.url = selectedNews.url ?? ""
        
        // Push SecondPageVC onto the navigation stack
        navigationController?.pushViewController(secondPageVC, animated: true)
    }

    
    
    private func calculateHeight() -> CGFloat {
        let cellWitdh = collectionView.frame.size.width - (Constants.cellLeftPadding + Constants.cellRightPadding)
        let posterImageHeight = cellWitdh * Constants.cellPosterImageRatio

        return (Constants.cellTitleHeight + posterImageHeight)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        .init(width: collectionView.frame.size.width - (Constants.cellLeftPadding + Constants.cellRightPadding), height: calculateHeight())
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: .zero, left: Constants.cellLeftPadding, bottom: .zero, right: Constants.cellRightPadding)
    }
}
