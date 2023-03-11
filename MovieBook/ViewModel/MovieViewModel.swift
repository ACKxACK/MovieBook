//
//  MovieViewModel.swift
//  MovieBook
//
//  Created by Ali Can Kayaaslan on 11.03.2023.
//

import Foundation

class MovieListViewModel {
    
    var movies = [Movie]()
    
    let downloaderClient = DownloaderClient()
    func movieSearch(movieName: String) {
        downloaderClient.downloadMovies(search: movieName) { (sonuc) in
            switch sonuc {
            case.failure(let error):
                print(error)
            case.success(let movieArray):
                if let movieArray = movieArray {
                    self.movies = movieArray
                }
            }
        }
    }
}
