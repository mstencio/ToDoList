//
//  NewItemsView.swift
//  toDoList
//
//  Created by Mau on 26/2/24.
//

import SwiftUI

struct NewItemsView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)
            
            Form {
                // title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //due date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // button
                TLButton(title: "Save", background: .green){
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    }else {
                        viewModel.showAlert = true
                    }
                }
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in all fields and select due date that is today or newer"))
            
            }
        }
    }
}

#Preview {
    NewItemsView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in}))
}
