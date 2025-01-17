//
//  Projet_mobileApp.swift
//  Projet mobile
//
//  Created by Samy Louchahi on 22/03/2024.
//

import SwiftUI

@main
struct Projet_mobileApp: App {
    @StateObject var viewModel = AuthViewModel()
    var body: some Scene {
        WindowGroup {
            RegisterView()
        }
        .environmentObject(viewModel)
    }
}
