

import Foundation

protocol Endpoint {
    var service: EndpointService {get set}
    var url: String {get set}
    var method: EndpointMethod {get set}
    var auth: AuthorizationHandler {get set}
    var parameters: [String: Any] {get set}
    var encoding: EndpointEncoding {get set}
    var headers: [String: String] {get set}
}

enum EndpointEncoding {
    case json
    case query
}

enum EndpointMethod: String {
    case get
    case post
    case put
    case delete
}

enum EndpointService {
    case users
    case albums
    case photos
  
    var url: String {
      //  http://newsapi.org/v2/everything?q=apple&from=2020-07-12&sortBy=publishedAt&apiKey=05113e24313641d091a6f7f9ecf226bd
        return "https://jsonplaceholder.typicode.com/\(self)"
    }
    
}
