//
//  NewsEndPoint.swift
//  NewsApp
//
//  Created by Ahmed on 18/06/2021.
//


import Foundation

struct NewsEndPoint: Endpoint {
    
   
    var service: EndpointService = .everything
    var url: String = ""
    var method: EndpointMethod = .get
    var encoding: EndpointEncoding = .query
    var auth: AuthorizationHandler = NoneAuthorizationHandler()
    var parameters: [String: Any] = [:]
    var headers: [String: String] = [:]

    init(page : Int) {
        url += "?q=apple&from=2021-06-17&to=2021-06-17&pageSize=\(page)&sortBy=popularity&apiKey=\(NetworkConstant.apiKey)"
         }
}
