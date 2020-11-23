//
//  JobListItemView.swift
//  iosJobFinder
//
//  Created by Hardik Trivedi on 23/11/2020.
//  Copyright © 2020 orgName. All rights reserved.
//

import SwiftUI

struct JobListItemView: View {
    
    let jobListViewModel: JobListViewModel
    
    var body: some View {
        HStack {
            LazyImageView(with: jobListViewModel.companyLogo ?? "")
                .frame(width: 60, height: 60, alignment: .leading)
                .background(Color.gray)
                .clipShape(Circle())
            Text(jobListViewModel.title.capitalized)
            Spacer()
        }
    }
}
