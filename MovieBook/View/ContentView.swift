//
//  ContentView.swift
//  MovieBook
//
//  Created by Ali Can Kayaaslan on 8.03.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
            DownloaderClient().downloadMovies(search: "Guardians") { result in
                switch result {
                case.success(let movieArray):
                    print(movieArray)
                case.failure(let error):
                    print(error)
                }
            }
        } label: {
            Text("Test Yap")
        }

    }
}
    
    
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
