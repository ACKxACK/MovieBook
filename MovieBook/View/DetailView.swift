//
//  DetailView.swift
//  MovieBook
//
//  Created by Ali Can Kayaaslan on 13.03.2023.
//

import SwiftUI

struct DetailView: View {
    
    let imdbID : String
    
    @ObservedObject var movieDetailViewModel = MovieDetailViewModel()
    
    var body: some View {
        
        VStack{
            
            MovieImage(url: movieDetailViewModel.movieDetail?.poster ?? "")
                .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.3, alignment: .center)
            
            Text(movieDetailViewModel.movieDetail?.title ?? "Movie Title Will Be Shown")
            
            Text(movieDetailViewModel.movieDetail?.plot ?? "Movie Plot Will Be Shown")
        }.onAppear(perform: {
            self.movieDetailViewModel.getMovieDetails(imdbID: imdbID)
        })
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbID: "test")
    }
}
