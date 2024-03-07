//
//  ToDoListItemsView.swift
//  toDoList
//
//  Created by Mau on 26/2/24.
//

import SwiftUI

struct ToDoListItemsView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack {
            VStack (alignment: .leading){
                Text(item.title)
                    .font(.body)
                Text("Due date: \(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Button {
                viewModel.toggleIsDone(item: item)
            }label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
            }
        }
    

    }
}

#Preview {
    ToDoListItemsView(item: .init(
        id: "1234",
        title: "Get milk",
        dueDate: Date().timeIntervalSince1970,
        createDate: Date().timeIntervalSince1970,
        isDone: true))
}
