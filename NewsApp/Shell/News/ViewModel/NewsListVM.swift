//
//  NewsListVM.swift
//  NewsApp
//
//  Created by Ahmed on 18/06/2021.
//

import Foundation
import Bond

class NewsListVM: BaseVM {
    
    // Dependencies
    private var routingManeger: RouterManager
    private var newsRepo: NewsRepo
    private var article: [Article] = []
    var articleSearch: DynamicObjects<[Article]> = DynamicObjects([])
   
    
    
    init(routingManeger: RouterManager, newsRepo: NewsRepo) {
        self.routingManeger = routingManeger
        self.newsRepo = newsRepo
        
    }
    
    // hydrate
    override func hydrate() {
    }
    
    func startSearch(searchText : String){
        if searchText != "" {
            articleSearch.value = article.filter { article in
                (article.title?.contains(searchText))!
            }
            
        }else {
            articleSearch.value = article
        }

    }
    func routeToDetails(index : Int){
        routingManeger.push(view: .newsDetails, presenter: NewsDetailsVM.self, item: NewsDetailsItem(articleSearch.value[index]))
    }
    
    func newsList(page : Int){
        self.showLoading()
        newsRepo.getNews(page : page).then { (response) in
            self.article = response.articles ?? []
            self.articleSearch.value = self.article
            print(response)
        }.catch { (error) in
            self.showSystemError(error: error)
        }.always {
            self.hideLoading()
        }
    }
    
    
}
