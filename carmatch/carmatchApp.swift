//
//  carmatchApp.swift
//  carmatch
//
//  Created by Sogah Mainib on 10/21/22.
//

import SwiftUI

@main
struct carmatchApp: App {
    
   private let mainVM = CarMatchVM()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: mainVM)
                .environmentObject(Chats())
        }
    }
}
