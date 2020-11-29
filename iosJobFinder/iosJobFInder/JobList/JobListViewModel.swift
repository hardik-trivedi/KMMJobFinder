//
//  JobListViewModel.swift
//  iosJobFinder
//
//  Created by Hardik Trivedi on 23/11/2020.
//  Copyright © 2020 orgName. All rights reserved.
//

import Foundation

struct JobListViewModel: Identifiable {
        let id: String
        let type: String
        let title: String
        let company: String
        let location: String
        let description: String
        let howToApply: String
        let createdAt: String
        let companyUrl: String
        let companyLogo: String?
}
