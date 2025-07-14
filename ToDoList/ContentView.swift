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
        }
        .listStyle(.plain)
        
        //connecting the views
        //shows up at the bottom since it is at the bottom of the contentView underneath the VStack
        if showNewTask {
            NewToDoView(showNewTask: $showNewTask, toDoItem: ToDoItem(title: "", isImportant: false))
        }
        
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ToDoItem.self, inMemory: true)
}
