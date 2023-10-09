//
//  Users.swift
//  TODO
//
//  Created by Muhammad Bassiouny on 9/20/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
