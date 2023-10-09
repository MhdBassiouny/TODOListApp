//
//  ToDoListItems.swift
//  TODO
//
//  Created by Muhammad Bassiouny on 9/20/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListItemsView: View {
    @StateObject var viewModel: ToDoListItemsViewModel
    @FirestoreQuery var items: [ToDoListItem]
        
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(
            wrappedValue: ToDoListItemsViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemsCell(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
            }
            .navigationTitle("ToDo List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListItems_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemsView(userId: "")
    }
}
