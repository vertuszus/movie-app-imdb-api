//
//  MovieListView.swift
//  MovieAppIMDb
//
//  Created by Honeymarketing on 11/04/21.
//  Copyright © 2021 Honeymarketing. All rights reserved.
//

import SwiftUI

struct MovieListView: View {
    
    let endpoint: MovieListEndpoint
    @ObservedObject var movieListState: MovieListState
    @Binding var selectedMovie: Movie?
    
    var body: some View {
        List(selection: self.$selectedMovie) {
            if self.movieListState.isLoading || self.movieListState.error != nil {
                LoadingView(isLoading: self.movieListState.isLoading, error: self.movieListState.error) {
                    self.movieListState.loadMovies(with: self.endpoint)
                }
                .padding(.top, 200)

            }
            
            if self.movieListState.movies != nil {
                ForEach(self.movieListState.movies!) { movie in
                    MovieRowView(movie: movie)
                        .tag(movie)
                }
            }
        }
        .onAppear {
            self.movieListState.loadMovies(with: self.endpoint)
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(endpoint: .nowPlaying, movieListState: MovieListState(), selectedMovie: .constant(nil))
    }
}
