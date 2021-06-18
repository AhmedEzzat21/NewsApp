//
//  NewsModel.swift
//  NewsApp
//
//  Created by Ahmed on 18/06/2021.
//



import Foundation

// MARK: - NewsMidel
struct NewsModel: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
}


// MARK: - Article
struct Article: Codable {
    var source: Source?
    var author: String?
    var title : String?
    var articleDescription: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
    init() {
        title = ""
        content = ""
        publishedAt = ""
        urlToImage = ""
        url = ""
        articleDescription = ""
        author = ""
        source = Source()
    }
}

// MARK: - Source
struct Source: Codable {
    var id, name: String?
    init() {
        id = ""
        name = ""
    }
}
