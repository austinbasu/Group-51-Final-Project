//
//  MovieModel.swift
//  CSE335 Project
//
//  Created by Jacob Ong on 10/22/22.
//

import Foundation

struct MovieType: Codable, Hashable {
    var movieTitle: String!
    var description: String!
    var releaseDate: String!
    var rating: Double!
    var genre: String!
    var userRating: Double!
}

struct getJSON: Codable {
    var results: [Info] = []
}

struct Info: Codable {
    let original_title: String
    let overview: String
    let vote_average: Double
    let release_date: String
    let genre_ids: [Int]
}

class MovieModel : ObservableObject {
    @Published var movieList = [MovieType]()
    @Published var watchList = [MovieType]()
    @Published var genres = [28: "Action", 12: "Adventure", 16: "Animation", 35: "Comedy", 80: "Crime", 99: "Documentary", 18: "Drama", 10751: "Family", 14: "Fantasy", 36: "History", 27: "Horror", 10402: "Music", 9648: "Mystery", 10749: "Romance", 878: "Science Fiction", 10770: "TV Movie", 53: "Thriller", 10752: "War", 37: "Western"]
    
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
            var tempGenre = ""
            for genre in json[0].genre_ids {
                tempGenre = tempGenre + "\(self.genres[genre]!) "
            }
            //print(json[0].genre_ids)
            newMovie.genre = tempGenre

            /*print(newMovie.description)
            print(newMovie.rating)
            print(newMovie.movieTitle)
            print(newMovie.releaseDate)*/

            self.movieList.append(newMovie!)
        })
        task.resume()
        
    }
    
    func addToWatchList(movieName: String, yourRatingCon: Double) {
        guard let url = URL(string:"https://api.themoviedb.org/3/search/movie?api_key=ee09f64be7f9569445877a12fb0023ff&language=en-US&query=\(movieName)&include_adult=false") else {
                print("Invalid URL")
                return
            }
        
      print(url)
        
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
            newMovie.userRating = yourRatingCon
            newMovie.movieTitle = json[0].original_title
            newMovie.releaseDate = json[0].release_date

            var tempGenre = ""
            for genre in json[0].genre_ids {
                tempGenre = tempGenre + "\(self.genres[genre]!) "
            }
            //print(json[0].genre_ids)
            newMovie.genre = tempGenre
            
            print(newMovie.description)
            print(newMovie.rating)
            print(newMovie.movieTitle)
            print(newMovie.releaseDate)
            print(newMovie.genre)

            self.watchList.append(newMovie!)
        })
        task.resume()
    }
    
   
}

