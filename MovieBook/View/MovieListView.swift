//
//  ContentView.swift
//  MovieBook
//
//  Created by Ali Can Kayaaslan on 8.03.2023.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var movieListViewModel : MovieListViewModel
    
    init() {
        self.movieListViewModel = MovieListViewModel()
        self.movieListViewModel.movieSearch(movieName: "Titanic")
    }
    
    var body: some View {
        
        List(movieListViewModel.movies, id: \.imdbID) { movie in
            HStack {
                Image("placeholder")
                    .resizable()
                    .frame(width: 100, height: 150)
                
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .padding(.bottom, 2)
                        .font(.system(size: 18))
                        .foregroundColor(.blue)
                    Text(movie.year)
                        .foregroundColor(.orange)
                        .font(.system(size: 14))
                }
            }
        }
    }
}
    
    
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
