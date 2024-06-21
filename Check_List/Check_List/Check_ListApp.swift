//
//  Check_ListApp.swift
//  Check_List
//
//  Created by RMS on 21/06/2024.
//

import SwiftUI
import SwiftData

@main
struct Check_ListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Baza.self)
    }
}
