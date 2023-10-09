//
//  ToDoListItemsViewModel.swift
//  TODO
//
//  Created by Muhammad Bassiouny on 9/20/23.
//

import Foundation
import FirebaseFirestore

class ToDoListItemsViewModel: ObservableObject {
    @Published var showingNewItemView = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
