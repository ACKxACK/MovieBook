//
//  MovieViewModel.swift
//  MovieBook
//
//  Created by Ali Can Kayaaslan on 11.03.2023.
//

import Foundation
import SwiftUI

class MovieListViewModel: ObservableObject {
    
    @Published var movies = [MovieViewModel]()
    
    let downloaderClient = DownloaderClient()
    
    func movieSearch(movieName: String) {
        
        downloaderClient.downloadMovies(search: movieName) { (sonuc) in
            switch sonuc {
            case .failure(let error):
                print(error)
            case .success(let movieArray):
                if let movieArray = movieArray {
                    DispatchQueue.main.async {
                        self.movies = movieArray.map(MovieViewModel.init)
                    }
                }
            }
        }
    }
}

struct MovieViewModel {
    
    let movie : Movie
    
    var title: String {
        movie.title
    }
    var poster: String {
        movie.poster
    }
    var year: String {
        movie.year
    }
    var imdbID: String {
        movie.imdbID
    }
//    var imdbRating: String {
//        movie.imdbRating
//    }
    
}
