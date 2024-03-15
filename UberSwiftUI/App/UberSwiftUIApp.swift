//
//  UberSwiftUIApp.swift
//  UberSwiftUI
//
//  Created by asimsharf on 02/03/2024.
//

import SwiftUI

@main
struct UberSwiftUIApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
