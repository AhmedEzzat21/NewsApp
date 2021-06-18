//
//  NewsRepoImpl.swift
//  NewsApp
//
//  Created by Ahmed on 18/06/2021.
//

import Foundation
import Foundation
import Promises

class NewsRepoImpl: NewsRepo {
   
    
    
    
    private var network: NetworkService
    private var localData: LocalData
    
    init(network: NetworkService = NetworkServiceImpl(), localData: LocalData = LocalDataImpl()) {
        self.network = network
        self.localData = localData
    }

    func getNews() -> Promise<ArticlesModel> {
        network.callModel(ArticlesModel.self, endpoint: NewsEndPoint())
    }
    
}
