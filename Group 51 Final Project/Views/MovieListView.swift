//
//  MovieListView.swift
//  CSE335 Project
//
//  Created by Jacob Ong on 10/22/22.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var movieModel = MovieModel()
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                List {
                    ForEach(movieModel.movieList, id: \.self) { movie in
                        Text("\(movie.movieTitle!)")
                        NavigationLink("View Movie", destination:DetailMovieView(title: movie.movieTitle, descr: movie.description, rating: movie.rating, releaseDate: movie.releaseDate, genre: movie.genre))
                    }
                }
            }
        .navigationTitle("My Movies List").navigationBarTitleDisplayMode(.inline)
            .toolbar
        {
            /*ToolbarItemGroup(placement: .navigationBarLeading)
            {
                NavigationLink(destination: RemoveCityView(customView: viewModel))
                {
                    Label("Remove", systemImage: "minus.square")
                }
            }*/
                
        }
        .toolbar
        {
            ToolbarItemGroup(placement: .navigationBarTrailing)
            {
                NavigationLink(destination: AddMovieView(movieModel: movieModel))
            {
                Label("Add", systemImage: "plus.app")
            }
                NavigationLink(destination: RecommendationView(movieModel: movieModel)) {
                    Label("Recommend", systemImage: "hand.thumbsup.fill")
                }
            }
        }
        }
    }
    
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
