//
//  NewToDoView.swift
//  ToDoList
//
//  Created by Vaibhavi Bandaru on 7/14/25.
//

import SwiftUI
import SwiftData

struct NewToDoView: View {
    
    @Binding var showNewTask: Bool
    
    //referencing the ___ and linking it together
    @Bindable var toDoItem: ToDoItem
    
    //to access the ModelContext
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            Text("Task title:")
                .font(.title)
                .fontWeight(.bold)
            
            TextField("Enter the task description...", text: $toDoItem.title, axis: .vertical)
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(15)
                .padding()
            
            Toggle(isOn: $toDoItem.isImportant) {
                Text("Is it important?")
            }
            
            Button("Save"){
                addToDo()
                showNewTask = false
            }
            .font(.title)
            .fontWeight(.bold)
            
        }
        .padding()
    }
    
    func addToDo() {
        let toDo = ToDoItem(title: toDoItem.title, isImportant: toDoItem.isImportant)
        modelContext.insert(toDo)
    }
    
    
}

#Preview {
    NewToDoView(showNewTask: .constant(false), toDoItem: ToDoItem(title: "", isImportant: false))
}

