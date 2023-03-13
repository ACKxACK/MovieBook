//
//  MovieDetailViewModel.swift
//  MovieBook
//
//  Created by Ali Can Kayaaslan on 13.03.2023.
//

import Foundation
import SwiftUI

class MovieDetailViewModel : ObservableObject {
    
    @Published var movieDetail : TheMovieDetailsViewModel?
    
    let downloaderClient = DownloaderClient()
    
    func getMovieDetails(imdbID: String) {
        
        downloaderClient.downloadMovieDetail(imdbID: imdbID) { sonuc in
            switch sonuc {
            case .failure(let error):
                print(error)
            case .success(let movieDetail):
                DispatchQueue.main.async {
                    self.movieDetail = TheMovieDetailsViewModel(detail: movieDetail)
                }
            }
        }
        
    }
}

struct TheMovieDetailsViewModel {
    let detail : MovieDetail
    
    var title: String {
        detail.title
    }
    var poster: String {
        detail.poster
    }
    var year: String {
        detail.year
    }
    var imdbID: String {
        detail.imdbID
    }
    var director: String {
        detail.director
    }
    var writer: String {
        detail.writer
    }
    var plot: String {
        detail.plot
    }
    var imdbRating: String {
        detail.imdbRating
    }
}
