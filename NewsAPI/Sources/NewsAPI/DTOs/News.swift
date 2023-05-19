import Foundation

public struct NewsResult: Decodable {
    public let status: String?
    public let copyright: String?
    public let section: String?
    public let lastUpdated: Date?
    public let numResults: Int?
    public let results: [News]?

    enum CodingKeys: String, CodingKey {
        case status, copyright, section, results
        case lastUpdated = "last_updated"
        case numResults = "num_results"
    }
}

public struct News: Decodable {
    public let title: String?
    public let abstract: String?
    public let byline: String?
    public let url: String?
    public let multimedia: [Multimedia]

    enum CodingKeys: String, CodingKey {
        case title, abstract, byline, url
        case multimedia
    }
}

public struct Multimedia: Decodable {
    public let url: String?
    public let format: String?
    public let height: Int?
    public let width: Int?
    public let type: String?
    public let subtype: String?
    public let caption: String?
    public let copyright: String?
}
