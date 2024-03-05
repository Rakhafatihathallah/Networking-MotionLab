//
//  Networking_MotionLabApp.swift
//  Networking-MotionLab
//
//  Created by Rakha Fatih Athallah on 14/02/24.
//

import SwiftUI

@main
struct Networking_MotionLabApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel())
        }
    }
}
