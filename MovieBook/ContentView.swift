//
//  ContentView.swift
//  MovieBook
//
//  Created by Ali Can Kayaaslan on 8.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = MovieDBViewModel()
    
    var body: some View {
        VStack {
            
        }
        .padding()
        .onAppear {
            viewModel.loadTrending()
        }
    }
}

class MovieDBViewModel: ObservableObject {
    
    @Published var homeScreen: [TrendinItem] = []
    
    static let apiKey = "637f2fd5df60e4509ce74fb9a361a066"
    static let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MzdmMmZkNWRmNjBlNDUwOWNlNzRmYjlhMzYxYTA2NiIsInN1YiI6IjY0MDg5MDRiNWUxMjAwMDBiMGYyZTA4ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Jg9flEV7HTaeE7oqmSUHyy9qrbdE6bW3JbiXLD787ro"
    
    //https://api.themoviedb.org/3/movie/550?api_key=637f2fd5df60e4509ce74fb9a361a066
    
    //https://api.themoviedb.org/3/trending/movie/day?api_key=637f2fd5df60e4509ce74fb9a361a066
    
    func loadTrending() {
        Task {
            let rul = URL(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=\(MovieDBViewModel.apiKey)")
            
        }
    }
    
}

struct TrendinItem: Identifiable, Decodable {
    
    let adult: Bool
    let id: Int
    let poster_path: String
    let title: String
    let vote_average: Float
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
