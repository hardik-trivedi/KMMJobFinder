//
//  JobDetailView.swift
//  iosJobFinder
//
//  Created by Hardik Trivedi on 28/11/2020.
//  Copyright © 2020 orgName. All rights reserved.
//

import SwiftUI

struct JobDetailView: View {
    
    let jobListViewModel: JobListViewModel
    
    init(jobListViewModel: JobListViewModel) {
        self.jobListViewModel = jobListViewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            LazyImageView(with: jobListViewModel.companyLogo ?? "")
                .frame(height: 250)
                Text(jobListViewModel.title)
                        .foregroundColor(Color.black)
                        .lineLimit(0)
                        .font(.headline)
                        .padding(.leading)
                Spacer().frame(height: 10)
                Text(jobListViewModel.company)
                        .foregroundColor(Color.gray)
                        .lineLimit(0)
                        .font(.subheadline)
                        .padding(.leading)
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
            Text(jobListViewModel.description)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .padding()
                Spacer()
                HStack {
                    Button(action:{
                        if let url = URL(string: jobListViewModel.companyUrl){
                            UIApplication.shared.open(url)
                        }
                    }){
                        Text("More information")
                    }
                    .padding(.leading)
                    Spacer()
                    Button(action:{
                        if let url = URL(string: jobListViewModel.howToApply){
                            UIApplication.shared.open(url)
                        }
                    }){
                        Text("How to apply")
                    }
                    .padding(.trailing)
                }
                Spacer()
            }
        }
    }

extension JobDetailView {
    enum JobDetailState {
        case loading
        case result([JobListViewModel])
        case error(String)
    }
    
    class ViewModel: ObservableObject {
        @Published var state = JobDetailState.loading
        private let apiClientManager: ApiClientManaging
        init(apiClientManager: ApiClientManaging) {
            self.apiClientManager = apiClientManager
        }
        
        func fetchJobDetail() {
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

struct JobDetailView_Previews: PreviewProvider {
    static var previews: some View {
        return JobDetailView(jobListViewModel : JobListViewModel(
            id: "1",
            type: "Full time",
            title: "iOS Engineer",
            company: "Globant LLC",
            location: "London, UK",
            description: "United Kingdom - Remote\\u003c/p\\u003e\n\\u003cp\\u003eAt CrowdStrike we’re on a mission - to stop breaches. Our groundbreaking technology, services delivery, and intelligence gathering together with our innovations in machine learning and behavioral-based detection, allow our customers to not only defend themselves, but do so in a future-proof manner. We’ve earned numerous honors and top rankings for our technology, organization and people – clearly confirming our industry leadership and our special culture driving it. We also offer flexible work arrangements to help our people manage their personal and professional lives in a way that works for them. So if you’re ready to work on unrivaled technology where your desire to be part of a collaborative team is met with a laser-focused mission to stop breaches and protect people globally, let’s talk.\\u003c/p\\u003e\n\\u003cp\\u003e\\u003cstrong\\u003eAbout The Role\\u003c/strong\\u003e\\u003c/p\\u003e\n\\u003cp\\u003eWe’re building a welcoming \\u0026amp; flexible team that prizes collaboration over competition, one which provides opportunities to learn new skills, mentor junior developers and contribute to the direction of both the team \\u0026amp; the products we’re responsible for. This is a high trust environment where we allow team members to manage their own time, take holidays as they need it and reward them with competitive salaries and equity.\\u003c/p\\u003e\n\\u003cp\\u003eOur stack is Ember, but if you've used frameworks like React or Angular you're the kind of person we're looking for and we'll help get you up to speed. As we support only evergreen browsers we can push the boundaries of what’s possible on the web as a platform, on top of a system that strips any hyperbole from the term “big data”. In close collaboration with analysts \\u0026amp; clients you’ll get to see the apps \\u0026amp; visualisations you’re building used every day to hunt for hackers and protect systems.\\u003c/p\\u003e\n\\u003cp\\u003eOur ideal candidates are sensitive to the needs of the users of their software \\u0026amp; love learning more about their tools every day. Get excited about new features in Chrome Devtools? Tested your work in screen readers? Ever lost half an hour getting an animation’s bezier curve to be just the right kind of bouncy? Looking for a challenge that’s out of the ordinary? Get in touch.\\u003c/p\\u003e\n\\u003cp\\u003eThe candidate will join the Mobile team to visualise and expose mobile settings and functionality in our customer-facing web apps. You'll collaborate closely with the mobile sensor and cloud engineers who develop the iOS and Android features, as well as UX designers, researchers and writers to maintain a consistent user experience across all our products.\\u003c/p\\u003e\n\\u003cp\\u003eApply with your CV and tell us a bit about why you would like to work at CrowdStrike and if you wish include links to your portfolio or projects you've worked on.\\u003c/p\\u003e\n\\u003cp\\u003eWe'll aim to review your application within a day or two and if we think you'll be a good fit we'll schedule an initial phone call. If we think CrowdStrike might be the place for you after that we'll invite you for an on-site interview where we'll review some code, discuss architecture in modern web apps, work processes and professional development. This will be followed by a second technical interview by video call, after which you'll get an answer within 3-4 days.\\u003c/p\\u003e\n\\u003cp\\u003e\\u003cstrong\\u003eWhat You’ll Need\\u003c/strong\\u003e\\u003c/p\\u003e\n\\u003cul\\u003e\n\\u003cli\\u003eA desire to collaborate closely with users, designers, \\u0026amp; testers to deliver quality software that solves problems.\\u003c/li\\u003e\n\\u003cli\\u003eA deep understanding of Javascript and considerable experience building thick-client applications with modern frameworks such as Ember, AngularJS, Backbone or React/Flux.\\u003c/li\\u003e\n\\u003cli\\u003eExperience with testing frameworks, tools and methodologies such as QUnit, Mocha \\u0026amp; Selenium.\\u003c/li\\u003e\n\\u003cli\\u003eFunctional knowledge \\u0026amp; interest in developing genuinely accessible interfaces.\\u003c/li\\u003e\n\\u003cli\\u003eStrong HTML \\u0026amp; CSS skills, with bonus points for experience with animation, knowledge of approaches to scalable/modular CSS, \\u0026amp; preprocessors such as SCSS \\u0026amp; LESS.\\u003c/li\\u003e\n\\u003cli\\u003eFamiliarity with client-side build processes \\u0026amp; tools - Grunt, Gulp, Ember CLI etc\\u003c/li\\u003e\n\\u003cli\\u003eComfortable with Git/version control workflows.\\u003c/li\\u003e\n\\u003c/ul\\u003e\n\\u003cp\\u003e\\u003cstrong\\u003eBonus Points Awarded For\\u003c/strong\\u003e\\u003c/p\\u003e\n\\u003cul\\u003e\n\\u003cli\\u003eExperience creating or contributing to open source projects.\\u003c/li\\u003e\n\\u003cli\\u003eExperience with graphics \\u0026amp; visualisation tools such as D3 or ThreeJS.\\u003c/li\\u003e\n\\u003cli\\u003eInterest \\u0026amp; experience with design \\u0026amp; data visualisation.\\u003c/li\\u003e\n\\u003cli\\u003eExperience with coaxing that last frame-per-second out of browsers.\\u003c/li\\u003e\n\\u003c/ul\\u003e\n\\u003cp\\u003e\\u003cstrong\\u003eBenefits of Working at CrowdStrike:\\u003c/strong\\u003e\\u003c/p\\u003e\n\\u003cul\\u003e\n\\u003cli\\u003eMarket leader in compensation and equity awards\\u003c/li\\u003e\n\\u003cli\\u003eCompetitive vacation policy\\u003c/li\\u003e\n\\u003cli\\u003eComprehensive health benefits\\u003c/li\\u003e\n\\u003cli\\u003ePaid parental leave, including adoption\\u003c/li\\u003e\n\\u003cli\\u003eFlexible work environment\\u003c/li\\u003e\n\\u003cli\\u003eWellness programs\\u003c/li\\u003e\n\\u003cli\\u003eStocked fridges, coffee, soda, and lots of treats\\u003c/li\\u003e\n\\u003c/ul\\u003e\n\\u003cp\\u003eWe are committed to building an inclusive culture of belonging that not only embraces the diversity of our people but also reflects the diversity of the communities in which we work and the customers we serve. We know that the happiest and highest performing teams include people with diverse perspectives and ways of solving problems so we strive to attract and retain talent from all backgrounds and create workplaces where everyone feels empowered to bring their full, authentic selves to work.\\u003c/p\\u003e\n\\u003cp\\u003eCrowdStrike is an Equal Opportunity employer. All qualified applicants will receive consideration for employment without regard to race, color, religion, sex including sexual orientation and gender identity, national origin, disability, protected veteran status, or any other characteristic protected by applicable federal, state, or local law.\\u003c/p\\u003e\n",
                howToApply: "https://bit.ly/3oBxqWa",
                createdAt: "Fri Oct 30 22:24:14 UTC 2020",
                companyUrl: "https://www.crowdstrike.com/careers/",
                companyLogo: "https://url.png"
                
        ))
    }
}
