//
//  MovieImage.swift
//  MovieBook
//
//  Created by Ali Can Kayaaslan on 13.03.2023.
//

import SwiftUI

struct MovieImage: View {
    
    let url : String
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url: String) {
        self.url = url
        self.imageDownloaderClient.downloadImage(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageDownloaderClient.downloadedImage {
            return  Image(uiImage: UIImage(data: data)!)
                .resizable()
        } else {
            return Image("placeholder")
                .resizable()
        }
    }
}

struct MovieImage_Previews: PreviewProvider {
    static var previews: some View {
        MovieImage(url: "https://m.media-amazon.com/images/M/MV5BYTRiNDQwYzAtMzVlZS00NTI5LWJjYjUtMzkwNTUzMWMxZTllXkEyXkFqcGdeQXVyNDIzMzcwNjc@._V1_SX300.jpg")
    }
}
