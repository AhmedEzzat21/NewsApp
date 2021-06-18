//
//  File.swift
//  NewsApp
//
//  Created by Ahmed on 18/06/2021.
//

import Foundation

class NewsDetailsItem: BaseItem {
    
    var article: Article
    
    init(_ article:Article) {
        self.article = article
        
    }
}
