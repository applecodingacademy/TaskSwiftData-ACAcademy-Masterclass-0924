//
//  TareaRow.swift
//  TaskSwiftData
//
//  Created by Julio César Fernández Muñoz on 17/9/24.
//

import SwiftUI

struct TareaRow: View {
    let tarea: Tareas
        
    var body: some View {
        VStack(alignment: .leading) {
            Text(tarea.nombre)
                .font(.headline)
            HStack {
                Text(tarea.fecha.formatted(date: .long, time: .omitted))
                Spacer()
                Text(tarea.estado.rawValue)
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
        }
    }
}
