//
//  LazyImageView.swift
//  iosJobFinder
//
//  Created by Hardik Trivedi on 23/11/2020.
//  Copyright © 2020 orgName. All rights reserved.
//

import SwiftUI
import Combine

struct LazyImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    
    var stateContent: AnyView {
        
        if imageLoader.dataIsValid, let image = UIImage(data: imageLoader.data ?? Data())  {
            return AnyView(
                Image(uiImage: image).resizable()
            )
        } else {
            return AnyView(
                ActivityIndicator(style: .medium)
            )
        }
    }
    
    init(with urlString: String) {
        imageLoader = ImageLoader(url: urlString)
    }
    
    var body: some View {
        HStack {
            stateContent
        }
    }
}
