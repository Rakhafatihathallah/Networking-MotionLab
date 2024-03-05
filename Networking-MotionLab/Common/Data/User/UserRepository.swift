//
//  UserRepository.swift
//  Networking-MotionLab
//
//  Created by Rakha Fatih Athallah on 14/02/24.
//

import Foundation
import Moya

//Repository: tempat untuk menyimpan semua yang berkaitan dengan pemanggilan data, baik local maupun remote
protocol UserRepository {
    func getListUser() async throws -> ListDataResponse<User>
    func getSingleUser(by id: Int) async -> Result<DataResponse<User>, Error>
}

final class DefaultUserRepository: UserRepository {
    
    private let provider: MoyaProvider<UserTargetType>
    
    init(provider: MoyaProvider<UserTargetType> = .defaultProvider() ) {
        self.provider = provider
    }
    
    func getListUser() async throws -> ListDataResponse<User> {
        try await provider.asyncRequest(.getListUser, model: ListDataResponse<User>.self)
    }
    
    func getSingleUser(by id: Int) async -> Result<DataResponse<User>, Error> {
        do {
            let response = try await provider.asyncRequest(.getSingleUser(id), model: DataResponse<User>.self)
            return .success(response)
        } catch {
            return .failure(error)
        }
    }
    
    
}

protocol GetListUserUseCase {
    func execute() async -> Result<ListDataResponse<User>, Error>
}

class DefaultGetListUserUseCase: GetListUserUseCase {
    
    private let repository: UserRepository
    
    init(repository: UserRepository = DefaultUserRepository()) {
        self.repository = repository
    }
    
    func execute() async -> Result<ListDataResponse<User>, Error> {
        do {
            let response = try await repository.getListUser()
            return .success(response)
        } catch {
            return .failure(error)
        }
    }
}
