//
//  NetworkResult.swift
//  iosJobFinder
//
//  Created by Hardik Trivedi on 23/11/2020.
//  Copyright © 2020 orgName. All rights reserved.
//

import Foundation

enum NetworkData<T> {
    case success(T)
    case failure(NetworkError)
}

enum NetworkError : Error {
    case noData
    case failedTofech
}
