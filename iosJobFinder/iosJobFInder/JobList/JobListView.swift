//
//  JobListView.swift
//  iosJobFinder
//
//  Created by Hardik Trivedi on 23/11/2020.
//  Copyright © 2020 orgName. All rights reserved.
//

import SwiftUI

struct JobListView: View {
    
    @ObservedObject private(set) var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            listView().navigationBarTitle(Text("Jobs"), displayMode: .inline)
        }
    }
    
    private func listView() -> AnyView {
            switch viewModel.state {
            case .loading:
                viewModel.fetchJobs()
                return AnyView(Text("Loading...").multilineTextAlignment(.center))
            case .result(let jobs):
                return AnyView(List(jobs){job in
                    NavigationLink(destination: JobDetailView(jobListViewModel: job)) {
                        JobListItemView(jobListViewModel: job)
                    }
                })
            case .error(let description):
                return AnyView(Text(description).multilineTextAlignment(.center))
            }
    }
}

extension JobListView {
    enum JobListState {
        case loading
        case result([JobListViewModel])
        case error(String)
    }
    
    class ViewModel: ObservableObject {
        @Published var state = JobListState.loading
        private let apiClientManager: ApiClientManaging
        init(apiClientManager: ApiClientManaging) {
            self.apiClientManager = apiClientManager
        }
        
        func fetchJobs() {
            apiClientManager.fetchJobList { result in
                switch result {
                case .failure(_ ):
                    self.state = .error("Something went wrong")
                case .success(let jobs):
                    self.state = .result(jobs)
                }
            }
        }
    }
}
