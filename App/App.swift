//
//  EpahApp.swift
//  Epah
//
//  Created by David Moreno on 5/10/22.
//

import SwiftUI

@main
struct EpahApp: App {
    @StateObject private var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
