//
//  HomeViewModel.swift
//  Networking-MotionLab
//
//  Created by Rakha Fatih Athallah on 14/02/24.
//

import Foundation

final class HomeViewModel: ObservableObject {
//    @Published private(set) var error:
    
    private let userRepository: UserRepository
    
    private let getListUseCase: GetListUserUseCase
    
    @Published var userList: [User] = []
    @Published var isError = false
    @Published var users: DataState<[User]> = .initial
    
    init(
        userRepository: UserRepository = DefaultUserRepository(),
        getListUseCase: GetListUserUseCase = DefaultGetListUserUseCase()
    ) {
        self.userRepository = userRepository
        self.getListUseCase = getListUseCase
    }
    
    @MainActor
     func getAllUser() async {
         let result = await getListUseCase.execute()
         
         switch result {
         case .success(let success):
             guard let response = success.data else { return }
//             if let response = success.data {
                 self.userList = response
                 self.users = .success(response)
//             }
             
             print("Go back")
         case .failure(let failure):
             print(failure)
             self.users = .error(failure)
         }
    }
}

extension HomeViewModel {
    enum ViewState {
        case isLoading
        case finished
    }
}
