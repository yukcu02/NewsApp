//
//  Decoders.swift
//  
//
//  Created by Furkan Yükcü on 18.05.2023.
//

import Foundation
public enum Decoders {
    static let dateDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
    
}
