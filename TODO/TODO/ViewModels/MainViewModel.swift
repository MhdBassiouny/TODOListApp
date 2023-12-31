//
//  MainViewModel.swift
//  TODO
//
//  Created by Muhammad Bassiouny on 9/20/23.
//

import Foundation
import FirebaseAuth

class MainViewModel: ObservableObject {
    @Published var currentUserId = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
