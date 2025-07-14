//
//  ContentView.swift
//  ToDoList
//
//  Created by Vaibhavi Bandaru on 7/14/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    //property
    @State private var showNewTask = false
    
    @Query var toDos: [ToDoItem]
    
    //For deleting the items
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            HStack {
                Text("To-Do List")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                Spacer()
                
                Button {
                    withAnimation {
                        showNewTask = true
                    }
                } label: {
                    Text("+")
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
        }
        .padding()
        Spacer()
        
        List {
            ForEach(toDos) { toDoItem in
                if toDoItem.isImportant
                {
                    Text("‼️" + toDoItem.title)
                }
                else
                {
                    Text(toDoItem.title)
                }
            }
            .onDelete(perform: deleteToDo)
        }
        .listStyle(.plain)
        
        //connecting the views
        //shows up at the bottom since it is at the bottom of the contentView underneath the VStack
        if showNewTask {
            NewToDoView(showNewTask: $showNewTask, toDoItem: ToDoItem(title: "", isImportant: false))
        }
    }
    
    func deleteToDo(at offsets: IndexSet)
    {
        for offset in offsets
        {
            let toDoItem = toDos[offset]
            modelContext.delete(toDoItem)
        }
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: ToDoItem.self, inMemory: true)
}
