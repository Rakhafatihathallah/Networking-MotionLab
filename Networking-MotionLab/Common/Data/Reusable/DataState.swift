//
//  DataState.swift
//  Networking-MotionLab
//
//  Created by Rakha Fatih Athallah on 05/03/24.
//

import Foundation

enum DataState<T> {
    case initial
    case loading
    case error(Error)
    case success(T)
    
    var value: T? {
        if case .success(let response) = self {
            return response
        }
        
        return nil
    }
    
    var error: Error? {
        if case .error(let error) = self {
            return error
        }
        
        return nil
    }
}
