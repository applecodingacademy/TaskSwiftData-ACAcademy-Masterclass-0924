//
//  NewTareaView.swift
//  TaskSwiftData
//
//  Created by Julio César Fernández Muñoz on 17/9/24.
//

import SwiftUI

struct NewTareaView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var nombre: String = ""
    @State private var descripcion: String = ""
    @State private var fecha: Date = Date()
    @State private var estado: EstadoTarea = .pendiente
    
    var body: some View {
        NavigationStack {
            Form {
                VStack(alignment: .leading) {
                    Text("Nombre de la tarea")
                        .font(.headline)
                        .padding(.leading, 5)
                    TextField("Ingrese el nombre de la tarea", text: $nombre)
                }
                VStack(alignment: .leading) {
                    Text("Descripción de la tarea")
                        .font(.headline)
                        .padding(.leading, 5)
                    TextField("Ingrese la descripción de la tarea", text: $descripcion)
                }
                DatePicker(selection: $fecha, displayedComponents: .date) {
                    Text("Fecha de la tarea")
                }
                Picker(selection: $estado) {
                    ForEach(EstadoTarea.allCases) { tarea in
                        Text(tarea.rawValue)
                    }
                } label: {
                    Text("Seleccione estado")
                }
            }
            .textFieldStyle(.roundedBorder)
            .navigationTitle("Nueva Tarea")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        let newTarea = Tareas(id: UUID(),
                                              nombre: nombre,
                                              descripcion: descripcion,
                                              fecha: fecha,
                                              estado: estado)
                        context.insert(newTarea)
                        dismiss()
                    } label: {
                        Text("Crear")
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancelar")
                    }
                }
            }
        }
    }
}

#Preview(traits: .sampleData) {
    NewTareaView()
}
