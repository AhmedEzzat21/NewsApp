

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
    case everything
    var url: String {
   
        return "http://newsapi.org/v2/\(self)"
    }
    
}
