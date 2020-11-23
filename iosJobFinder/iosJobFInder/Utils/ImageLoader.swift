//
//  ImageLoader.swift
//  iosJobFinder
//
//  Created by Hardik Trivedi on 23/11/2020.
//  Copyright © 2020 orgName. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class ImageLoader: ObservableObject {
    @Published var dataIsValid = false
    
    var data: Data?
    
    init(url: String) {
        
        print("Url for loading the image is : \(url)")
        guard let imageUrl = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { (data, _, _) in
            guard let data = data else { return }
            DispatchQueue.main.async { [weak self] in
                self?.data = data
                self?.dataIsValid = true
            }
            
        }.resume()
    }
}
