

import Foundation
import Promises

protocol NetworkService {
    func call(endpoint: Endpoint) -> Promise<Data>
    func callModel<Model: Codable>(_ model: Model.Type, endpoint: Endpoint) -> Promise<Model>
    func uploadModel<Model: Codable>(_ model: Model.Type, endpoint: Endpoint) -> Promise<Model>
}
