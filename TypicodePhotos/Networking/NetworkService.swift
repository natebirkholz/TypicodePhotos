// NetworkService.swift
// Created by Nate Birkholz

import Combine
import Foundation

enum NetworkError: Error {
    case urlError
    case decodeError
    case imageDecodeError
    case networkError(Error)
    case invalidStatusCode(Int)
}

class NetworkService {
    func fetchData(from url: URL) -> AnyPublisher<Data, NetworkError> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.succeeded else {
                    throw NetworkError.invalidStatusCode((response as? HTTPURLResponse)?.statusCode ?? 0)
                }
                return data
            }
            .mapError { NetworkError.networkError($0) }
            .eraseToAnyPublisher()
    }
}
