//
//  HomeNewsService.swift
//  
//
//  Created by Furkan Yükcü on 18.05.2023.
//

import Foundation
import Alamofire
public protocol HomeNewsServiceProtocol: AnyObject {
    func fetchHomeNews(completion: @escaping (Result< [News], Error >) -> Void)
}

public class HomeNewsService: HomeNewsServiceProtocol {
    public init () {}
    public func fetchHomeNews(completion: @escaping (Result< [News], Error >) ->Void) {
        let urlString = "https://api.nytimes.com/svc/topstories/v2/home.json?api-key=XnpIrPisiCBnY0L8E7Wvs9KPOsnyXbYm"
        AF.request(urlString).responseData { response in
            switch response.result {
                
            case .success(let data):
                let decoder = Decoders.dateDecoder
                
                do {
                    let response = try decoder.decode(HomeNewsResponse.self, from: data)
                    completion(.success(response.results))
                } catch {
                    print("********** JSON DECODE ERROR *******")
                }
            case .failure(let error):
                print("**** GEÇİCİ BİR HATA OLUŞTU: \(error.localizedDescription) ******")
            }
        }
        
    }
   
}
