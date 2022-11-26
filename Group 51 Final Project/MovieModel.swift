//
//  MovieModel.swift
//  CSE335 Project
//
//  Created by Jacob Ong on 10/22/22.
//

import Foundation

struct MovieType: Codable, Hashable {
    //var earthquakes: [Info] = []
    var movieTitle: String!
    var description: String!
    var releaseDate: String!
    var rating: Double!
}

struct getJSON: Codable {
    var results: [Info] = []
}

struct Info: Codable {
    let original_title: String
    let overview: String
    let vote_average: Double
    let release_date: String
  
}

class MovieModel : ObservableObject {
    @Published var movieList = [MovieType]()
    @Published var watchList = [MovieType]()

    
    init() {
        
    }
    
    func addToMovieList(movieName: String) {
        guard let url = URL(string:"https://api.themoviedb.org/3/search/movie?api_key=ee09f64be7f9569445877a12fb0023ff&language=en-US&query=\(movieName)&include_adult=false") else {
                print("Invalid URL")
                return
            }
      
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("bad things")
                return
            }
            var result: getJSON?
            do {
                result = try JSONDecoder().decode(getJSON.self, from: data)
            }
            catch {
                print("errorr\(error.localizedDescription)")
            }
            
            guard let json = result?.results else {
                print("json fail")
                return
            }
            
            var newMovie: MovieType! = MovieType()
            
            newMovie.description = json[0].overview
            newMovie.rating = json[0].vote_average
            newMovie.movieTitle = json[0].original_title
            newMovie.releaseDate = json[0].release_date

            
            print(newMovie.description)
            print(newMovie.rating)
            print(newMovie.movieTitle)
            print(newMovie.releaseDate)

            self.movieList.append(newMovie!)
        })
        task.resume()
        
    }
    
    func addToWatchList() {
        
    }
    
   
}

