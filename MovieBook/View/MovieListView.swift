//
//  ContentView.swift
//  MovieBook
//
//  Created by Ali Can Kayaaslan on 8.03.2023.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var movieListViewModel : MovieListViewModel
    
    @State var searchMovie = ""
    
    init() {
        self.movieListViewModel = MovieListViewModel()
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                TextField("Search Movie", text: $searchMovie, onCommit: {
                    self.movieListViewModel.movieSearch(movieName: searchMovie.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? searchMovie)
                })
                    .padding()
                    .background(Color.gray.opacity(0.11))
                    .cornerRadius(20)
                    .padding(5)
                
                List(movieListViewModel.movies, id: \.imdbID) { movie in
                    
                    NavigationLink {
                        DetailView(imdbID: movie.imdbID)
                    } label: {
                        HStack {
                            MovieImage(url: movie.poster)
                                .frame(width: 90, height: 140)
                                .cornerRadius(8)
                            
                            VStack(alignment: .leading) {
                                Text(movie.title)
                                    .padding(.bottom, 2)
                                    .font(.system(size: 20))
                                    .foregroundColor(.blue)
                                Text(movie.year)
                                    .foregroundColor(.gray)
                                    .padding(.bottom,2)
                                    .font(.system(size: 14))
                                HStack {
                                    Text("6.7")
                                        .foregroundColor(Color.orange)
                                    Image(systemName: "hand.thumbsup.fill")
                                        .foregroundColor(.orange)
                                }
                            }
                        }
                    }

                    
                    
                }.navigationTitle(Text("Movie Book"))
            }
        }
    }
}
    
    
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
