//
//  NoteScannerApp.swift
//  NoteScanner
//
//  Created by Saqer Alshehri on 05/10/1447 AH.
//

import SwiftUI
import SwiftData

@main
struct NoteScannerApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for : Note.self)
    }
}
