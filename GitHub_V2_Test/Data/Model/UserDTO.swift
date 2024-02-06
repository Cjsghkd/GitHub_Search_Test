//
//  UserDTO.swift
//  GitHub_V2_Test
//
//  Created by jointree on 2024/02/05.
//

import Foundation

struct UserDTO: Codable {
    let total_count: Int
    let incomplete_results: Bool
    let items: [Item]
}
