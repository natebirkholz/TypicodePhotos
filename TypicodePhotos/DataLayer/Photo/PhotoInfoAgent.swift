// PhotoInfoAgent.swift
// Created by Nate Birkholz

import Combine
import Foundation

/// Currently included for thoroughness, would be used for a DetailView
struct PhotoInfoAgent: DataAgent {
    let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func fetchPhotoArray() -> AnyPublisher<[PhotoInfoModel], NetworkError> {
        return networkService.fetchData(from: APIEndpoint.photosAlbum.url())
            .decode(type: [PhotoInfoModel].self, decoder: JSONDecoder())
            .mapError({ error in
                if error is DecodingError {
                    return NetworkError.decodeError
                }
                return NetworkError.networkError(error)
            })
            .eraseToAnyPublisher()
    }
}
