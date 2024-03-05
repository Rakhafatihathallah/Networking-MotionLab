//
//  DetailViewModel.swift
//  Networking-MotionLab
//
//  Created by Rakha Fatih Athallah on 28/02/24.
//

import Foundation

class DetailViewModel: ObservableObject {
    
    private let userRepository: UserRepository
    
    @Published var user: User?
    @Published var error = ""
    
    init(userRepository: UserRepository = DefaultUserRepository()) {
        self.userRepository = userRepository
    }
    
    @MainActor
    func getUser() {
        Task {
            let result = await userRepository.getSingleUser(by: 2)
            
            switch result {
            case .success(let success):
                self.user = success.data
            case .failure(let failure):
                self.error = failure.localizedDescription
            }
        }
    }
    
    @MainActor
    func getAllUser() {
        Task {
            
        }
    }
}
