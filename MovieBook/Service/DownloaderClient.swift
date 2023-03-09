//
//  DownloaderClient.swift
//  MovieBook
//
//  Created by Ali Can Kayaaslan on 9.03.2023.
//

import Foundation

class DownloaderClient {
    
    func downloadMovies(search: String, completion: @escaping (Result<[Movie]?, DownloaderError>) -> Void) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=5ab52e8b") else {
            return completion(.failure(.wrongUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.dataNotCome))
            }
            
            guard let movieRespond = try? JSONDecoder().decode(MovieResults.self, from: data) else {
                return completion(.failure(.dataNotProcess))
            }
            
            completion(.success(movieRespond.movies))
            
        }.resume()
        
    }

}

enum DownloaderError: Error {
    case wrongUrl
    case dataNotCome
    case dataNotProcess
}
