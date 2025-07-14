//
//  NewToDoView.swift
//  ToDoList
//
//  Created by Vaibhavi Bandaru on 7/14/25.
//

import SwiftUI
import SwiftData

struct NewToDoView: View {
    
    //referencing the ___ and linking it together
    @Bindable var toDoItem: ToDoItem
    
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
                
            }
            .font(.title)
            .fontWeight(.bold)
            
        }
        .padding()
    }
}

#Preview {
    NewToDoView(toDoItem: ToDoItem(title: "", isImportant: false))
}
