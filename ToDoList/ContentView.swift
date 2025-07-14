//
//  ContentView.swift
//  ToDoList
//
//  Created by Vaibhavi Bandaru on 7/14/25.
//

import SwiftUI

struct ContentView: View {
    
    //property
    @State private var showNewTask = false
    
    
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
        
        //connecting the views
        //shows up at the bottom since it is at the bottom of the contentView underneath the VStack
        if showNewTask {
            NewToDoView()
        }
        
    }
}

#Preview {
    ContentView()
}
