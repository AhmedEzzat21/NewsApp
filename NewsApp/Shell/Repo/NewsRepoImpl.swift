//
//  NewsRepoImpl.swift
//  NewsApp
//
//  Created by Ahmed on 18/06/2021.
//

import Foundation
import Promises

class NewsRepoImpl: NewsRepo {
   

    private var network: NetworkService
    private var localData: LocalData
    
    init(network: NetworkService = NetworkServiceImpl(), localData: LocalData = LocalDataImpl()) {
        self.network = network
        self.localData = localData
    }

    func getNews(page : Int) -> Promise<NewsModel> {
        network.callModel(NewsModel.self, endpoint: NewsEndPoint(page: page))
    }
    
}
