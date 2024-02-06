//
//  UserService.swift
//  GitHub_V2_Test
//
//  Created by jointree on 2024/02/05.
//

import Foundation
import Moya

enum UserService {
    case searchUser(q: String)
}

extension UserService: TargetType {
    public var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var path: String {
        switch self {
        case .searchUser:
            return "/search/users"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .searchUser:
            return .get
        }
    }
    
    var sampleData: Data {
        return "@@".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .searchUser(let q):
            return .requestParameters(parameters: ["q" : q], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return ["X-GitHub-Api-Version": "2022-11-28"]
    }
}
