//
//  SampleData.swift
//  TaskSwiftData
//
//  Created by Julio César Fernández Muñoz on 17/9/24.
//

import SwiftUI
import SwiftData

struct SampleData: PreviewModifier {
    static func makeSharedContext() async throws -> ModelContainer {
        let schema = Schema([Tareas.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
        
        let tarea1 = Tareas(id: UUID(),
                            nombre: "Realizar masterclass",
                            descripcion: "Tarea con respecto a la realización de la masterclass de SwiftData de Apple Coding Academy para el Swift Developer Program",
                            fecha: .now,
                            estado: .enProgreso)
        let tarea2 = Tareas(id: UUID(),
                            nombre: "Subir vídeo a Youtube",
                            descripcion: "Una vez termine el directo subirlo a Youtube para que lo vea el mundo y lo goze cosa fina como una película de Maculiculkin en un viaje a Albacete en autobús.",
                            fecha: .now,
                            estado: .pendiente)
        
        container.mainContext.insert(tarea1)
        container.mainContext.insert(tarea2)

        return container
    }
    
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
}

extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var sampleData: Self = .modifier(SampleData())
}
