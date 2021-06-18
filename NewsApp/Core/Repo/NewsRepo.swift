//
//  NewsRepo.swift
//  NewsApp
//
//  Created by Ahmed on 18/06/2021.
//

import Foundation
import Promises

protocol NewsRepo {

    func getNews() -> Promise<NewsModel>

}
