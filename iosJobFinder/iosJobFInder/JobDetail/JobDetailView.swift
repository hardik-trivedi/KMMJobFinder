//
//  JobDetailView.swift
//  iosJobFinder
//
//  Created by Hardik Trivedi on 28/11/2020.
//  Copyright © 2020 orgName. All rights reserved.
//

import SwiftUI

struct JobDetailView: View {
    @Environment(\.presentationMode) var presentation
    
    let jobListViewModel: JobListViewModel
    
    init(jobListViewModel: JobListViewModel) {
        self.jobListViewModel = jobListViewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            LazyImageView(with: jobListViewModel.companyLogo ?? "")
                .frame(height: 250)
            VStack(alignment: .leading) {
                HStack {
                    Text(jobListViewModel.title)
                        .foregroundColor(Color.black)
                        .lineLimit(0)
                        .font(.headline)
                        .padding(.leading)
                }
                Spacer().frame(height: 10)
                HStack {
                    Text(jobListViewModel.company)
                        .foregroundColor(Color.gray)
                        .lineLimit(0)
                        .font(.subheadline)
                        .padding(.leading)
                }
                Spacer().frame(height: 10)
                HStack {
                    Text(jobListViewModel.type)
                        .foregroundColor(Color.gray)
                        .lineLimit(0)
                        .font(.subheadline)
                        .padding(.leading)
                    Spacer()
                    Text(jobListViewModel.location)
                        .foregroundColor(Color.gray)
                        .lineLimit(0)
                        .font(.subheadline)
                        .padding(.trailing)
                }
                HStack {
                    Text(jobListViewModel.type)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .padding()
                }
                HStack {
                    Button(action:{
                        
                    }){
                        Text("More information")
                    }
                    .padding(.leading)
                    Spacer()
                    Button(action:{
                        
                    }){
                        Text("How to apply")
                    }
                    .padding(.trailing)
                }
            }
        }
    }
}

struct JobDetailView_Previews: PreviewProvider {
    static var previews: some View {
        return JobDetailView(jobListViewModel : JobListViewModel(
            id: "1",
            type: "Full time",
            title: "iOS Engineer",
            company: "Globant LLC",
            location: "London, UK",
            companyLogo: "https://url.png"
        ))
    }
}
