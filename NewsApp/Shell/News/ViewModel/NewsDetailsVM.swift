//
//  NewsDetailsVM.swift
//  NewsApp
//
//  Created by Ahmed on 18/06/2021.
//

import Foundation
import Bond
class NewsDetailsVM: BaseVM {
    
    // Dependencies
    private var routingManeger: RouterManager
    private var newsRepo: NewsRepo
    private var item : NewsDetailsItem
    var article: DynamicObjects<Article?> = DynamicObjects(Article())
    // Observables

    
    init(routingManeger: RouterManager, newsRepo: NewsRepo , item : NewsDetailsItem) {
        self.routingManeger = routingManeger
        self.newsRepo = newsRepo
        self.item = item
        
    }
    
    // hydrate
    override func hydrate() {
        self.article.value = item.article
    }
    
   
 

}
