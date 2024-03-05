//
//  MoyaProvider+defaultProvider.swift
//  Networking-MotionLab
//
//  Created by Rakha Fatih Athallah on 14/02/24.
//

import Foundation
import Moya

extension MoyaProvider {
    static func defaultProvider() -> MoyaProvider {
        return MoyaProvider(plugins: [NetworkLoggerPlugin()])
    }
}
