//
//  UserViewModel.swift
//  GitHub_V2_Test
//
//  Created by jointree on 2024/02/05.
//

import Foundation
import Moya

class UserViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var userResponse: UserDTO?
    @Published var isSearchCompleted = false
    
    func searchUser() {
        let userProvider = MoyaProvider<UserService>()
        userProvider.request(.searchUser(q: searchText)) { result in
            DispatchQueue.global().async {
                switch result {
                case let .success(result):
                    let responseData = result.data
                    print(String(data: responseData, encoding: .utf8))
                    do {
                        self.userResponse = try JSONDecoder().decode(UserDTO.self, from: responseData)
                        self.isSearchCompleted = true
                    } catch (let err) {
                        self.isSearchCompleted = false
                        print(String(describing: err))
                        print("ERROR")
                    }
                    
                    let statusCode = result.statusCode
                    switch statusCode {
                    case 200..<300:
                        print("success")
                    case 304:
                        print("Not modified")
                    case 422:
                        print("Validation failed")
                    case 503:
                        print("Server Error")
                    default:
                        print("ERROR")
                    }
                case .failure(let err):
                    print(String(describing: err))
                }
            }
        }
    }
}
