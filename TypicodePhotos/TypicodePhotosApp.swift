// TypicodePhotosApp.swift
// Created by Nate Birkholz

import Combine
import SwiftUI

@main
struct TypicodePhotosApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel(photoInfoAgent: PhotoInfoAgent(networkService: NetworkService()),
                                              cancellablesSet: Set<AnyCancellable>(),
                                              photoInfoModels: []))
        }
    }
}
