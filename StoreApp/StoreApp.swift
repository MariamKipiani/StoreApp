//
//  StoreAppApp.swift
//  StoreApp
//
//  Created by user on 12/19/23.
//

import SwiftUI

@main
struct StoreApp: App {
    @StateObject private var viewModel = MainViewModel()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
        }
    }
}

