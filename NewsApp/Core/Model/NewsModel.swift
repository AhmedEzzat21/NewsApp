//
//  NewsModel.swift
//  NewsApp
//
//  Created by Ahmed on 18/06/2021.
//



import Foundation

// MARK: - NewsMidel
struct NewsModel: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    let source: Source?
    let author: String?
    let title, articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: Date?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct Source: Codable {
    let id, name: String?
}
typealias ArticlesModel = [Article]
