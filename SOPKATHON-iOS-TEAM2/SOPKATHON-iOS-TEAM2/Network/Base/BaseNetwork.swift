
import Foundation

import Moya

protocol NetworkServiceProtocol {
    associatedtype Target: TargetType
    var provider: MoyaProvider<Target> { get }
    func request<T: Decodable>(_ target: Target, completion: @escaping (Result<T, Error>) -> Void)
}

class NetworkService<T: TargetType>: NetworkServiceProtocol {
    typealias Target = T
    let provider: MoyaProvider<T>

    init(provider: MoyaProvider<T> = MoyaProvider<T>(plugins: [NetworkLoggerPlugin()])) {
        self.provider = provider
    }

    func request<U: Decodable>(_ target: T, completion: @escaping (Result<U, Error>) -> Void) {
        provider.request(target) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode(U.self, from: response.data)
                    completion(.success(decoded))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
