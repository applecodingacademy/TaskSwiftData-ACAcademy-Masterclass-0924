//
//  TaskSwiftDataApp.swift
//  TaskSwiftData
//
//  Created by Julio César Fernández Muñoz on 17/9/24.
//

import SwiftUI
import SwiftData

@main
struct TaskSwiftDataApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([Tareas.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
