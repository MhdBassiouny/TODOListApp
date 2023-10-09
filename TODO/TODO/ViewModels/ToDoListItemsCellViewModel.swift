//
//  ToDoListItemsCellViewModel.swift
//  TODO
//
//  Created by Muhammad Bassiouny on 9/20/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemsCellViewModel: ObservableObject {
    func toggleIIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        guard let uId = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
