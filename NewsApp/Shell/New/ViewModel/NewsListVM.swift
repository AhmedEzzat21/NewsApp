//
//  NewsListVM.swift
//  NewsApp
//
//  Created by Ahmed on 18/06/2021.
//

import Foundation

class NewsListVM: BaseVM {
    
    // Dependencies
    private var routingManeger: RouterManager
    private var newsRepo: NewsRepo
    
    // Observables

    
    init(routingManeger: RouterManager, newsRepo: NewsRepo) {
        self.routingManeger = routingManeger
        self.newsRepo = newsRepo
        
    }
    
    // hydrate
    override func hydrate() {
        
    }
    
  
   

}
