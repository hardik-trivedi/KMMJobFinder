//
//  ApiClientManager.swift
//  iosJobFinder
//
//  Created by Hardik Trivedi on 23/11/2020.
//  Copyright © 2020 orgName. All rights reserved.
//

import Foundation
import shared

protocol ApiClientManaging {
    func fetchJobList(completion: @escaping (NetworkData<[JobListViewModel]>) -> ())
}

struct ApiClientManager: ApiClientManaging {
    let sharedApiClient : SharedApiClient
    
    init(sharedApiClient: SharedApiClient) {
        self.sharedApiClient = sharedApiClient
    }
    
    func fetchJobList(completion: @escaping (NetworkData<[JobListViewModel]>) -> ()) {
        
        completion(.success([]))
        
        // This will call API
        try? sharedApiClient.getJobInfo{ (jobInfoViewModel, error) in
            
            DispatchQueue.main.async {
                if let _ = error {
                    completion(.failure(.failedTofech))
                } else {
                    guard let jobInfoViewModel = jobInfoViewModel else {
                        return completion(.failure(.noData))
                    }
                    completion(.success(jobInfoViewModel.map { JobListViewModel(model: $0) }))
                }
            }
        }
    }
}

extension JobListViewModel {
    init(model: JobInfo) {
        id = model.id
        type = model.type
        title = model.title
        company = model.company
        location = model.location
        companyLogo = model.companyLogo
    }
}

