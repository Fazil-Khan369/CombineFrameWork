//
//  UserViewModel.swift
//  Combine+MVVM
//
//  Created by Fazil P on 06/11/2023.
//

import Foundation
import Combine

final class UserViewModel: ObservableObject {
    
    @Published var users: [UserModel] = []
    @Published var hasError = false
    @Published var error: UserError?
    @Published private(set) var isRefreshing = false
    
    private var bag = Set<AnyCancellable>()
    
    func fetchUsers() {
        
        isRefreshing = true
        hasError = false
        
        let userUrlString = "https://jsonplaceholder.typicode.com/users"
        if let url = URL(string: userUrlString) {
            
            URLSession.shared.dataTaskPublisher(for: url)
                .receive(on: DispatchQueue.main)
                .tryMap({ res in
                    
                    guard let response = res.response as? HTTPURLResponse,
                          response.statusCode >= 200 && response.statusCode <= 300 else {
                        throw UserError.invalidStatusCode
                    }
                    
                    let decoder = JSONDecoder()
                    guard let users = try? decoder.decode([UserModel].self, from: res.data) else {
                        throw UserError.failedToDecode
                        print(res.data)
                    }
                    
                    return users
                })
                .sink { [weak self] res in
                    
                    defer {self?.isRefreshing = false }
                    
                    switch res {
                    case .failure(let error):
                        self?.hasError = true
                        self?.error = UserError.custom(error: error)
                    default: break
                    }
                    
                } receiveValue: { [weak self] users in
                    
                    self?.users = users
                }
                .store(in: &bag)
            
        }
    }
}

extension UserViewModel {
    
    enum UserError: LocalizedError {
        case custom(error: Error)
        case failedToDecode
        case invalidStatusCode
        
        var errorDescription: String? {
            switch self {
            case .failedToDecode:
                return "Failed tp decode response"
            case .custom(let error):
                return error.localizedDescription
            case .invalidStatusCode:
                return "Request falls within an invalid range"
            }
        }
    }
}
