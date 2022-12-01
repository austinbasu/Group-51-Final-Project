import Foundation
//import WeatherKit
//import CoreLocation

//We did not get the weatherkit api working so this will mimic it to allow you to see what the getMovieRecommendation function would do
func getCurrentWeather() -> String {
    let weatherArray = ["cloudy","sunny","rainy", "snowy", "windy"]
    return weatherArray.randomElement()!
}

func getCurrentDate() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM.dd"
    return formatter.string(from: Date())
}

func getCurrentTime() -> String {
    let formatter = DateFormatter()
    var result = ""
    formatter.dateFormat = "HH"
    let time = Int(formatter.string(from: Date()))!
    if time >= 0 || time <= 11 {
        result = "morning"
    } else if time >= 12 || time <= 18 {
        result = "afternoon"
    } else {
        result = "night"
    }
    return result
}

func getMovieRecommendation(movieList: MovieModel) -> String {
    let movieSelection = movieList.movieList
    var tempList:[String] = []
    if currDate == "10.31" {
        return halloweenMovieList.randomElement()!
    } else if currDate == "12.25" {
        return christmasMovieList.randomElement()!
    } else {
        switch currWeather {
            
        case "sunny":
            if currTime == "morning" {
                for movie in movieSelection {
                    if movie.genre == "Family" {
                        tempList.append(movie.movieTitle)
                    }
                }
                if !(tempList.isEmpty) {
                    return tempList.randomElement()!
                } else {
                    return (movieSelection.randomElement()?.movieTitle)!
                }
            } else if currTime == "afternoon" {
                for movie in movieSelection {
                    if movie.genre == "Adventure" || movie.genre == "Comedy" {
                        tempList.append(movie.movieTitle)
                    }
                }
                if !(tempList.isEmpty) {
                    return tempList.randomElement()!
                } else {
                    return (movieSelection.randomElement()?.movieTitle)!
                }
                } else {
                    for movie in movieSelection {
                        if movie.genre == "Action" || movie.genre == "Romance" {
                            tempList.append(movie.movieTitle)
                        }
                    }
                    if !(tempList.isEmpty) {
                        return tempList.randomElement()!
                    } else {
                        return (movieSelection.randomElement()?.movieTitle)!
                    }
                }
            
        case "rainy":
            if currTime == "morning" {
                for movie in movieSelection {
                    if movie.genre == "Drama" {
                        tempList.append(movie.movieTitle)
                    }
                }
                if !(tempList.isEmpty) {
                    return tempList.randomElement()!
                } else {
                    return (movieSelection.randomElement()?.movieTitle)!
                }
            } else if currTime == "afternoon" {
                for movie in movieSelection {
                    if movie.genre == "Crime" {
                        tempList.append(movie.movieTitle)
                    }
                }
                if !(tempList.isEmpty) {
                    return tempList.randomElement()!
                } else {
                    return (movieSelection.randomElement()?.movieTitle)!
                }
            } else {
                for movie in movieSelection {
                    if movie.genre == "Horror" || movie.genre == "Mystery" {
                        tempList.append(movie.movieTitle)
                    }
                }
                if !(tempList.isEmpty) {
                    return tempList.randomElement()!
                } else {
                    return (movieSelection.randomElement()?.movieTitle)!
                }
            }
            
        case "windy":
            if currTime == "morning" {
                for movie in movieSelection {
                    if movie.genre == "Western" {
                        tempList.append(movie.movieTitle)
                    }
                }
                if !(tempList.isEmpty) {
                    return tempList.randomElement()!
                } else {
                    return (movieSelection.randomElement()?.movieTitle)!
                }
            } else if currTime == "afternoon" {
                for movie in movieSelection {
                    if movie.genre == "Music" {
                        tempList.append(movie.movieTitle)
                    }
                }
                if !(tempList.isEmpty) {
                    return tempList.randomElement()!
                } else {
                    return (movieSelection.randomElement()?.movieTitle)!
                }
            } else {
                for movie in movieSelection {
                    if movie.genre == "TV Movie" {
                        tempList.append(movie.movieTitle)
                    }
                }
                if !(tempList.isEmpty) {
                    return tempList.randomElement()!
                } else {
                    return (movieSelection.randomElement()?.movieTitle)!
                }
            }

        case "snowy":
            if currTime == "morning" {
                for movie in movieSelection {
                    if movie.genre == "History" {
                        tempList.append(movie.movieTitle)
                    }
                }
                if !(tempList.isEmpty) {
                    return tempList.randomElement()!
                } else {
                    return (movieSelection.randomElement()?.movieTitle)!
                }
            } else if currTime == "afternoon" {
                for movie in movieSelection {
                    if movie.genre == "Fantasy" {
                        tempList.append(movie.movieTitle)
                    }
                }
                if !(tempList.isEmpty) {
                    return tempList.randomElement()!
                } else {
                    return (movieSelection.randomElement()?.movieTitle)!
                }
            } else {
                for movie in movieSelection {
                    if movie.genre == "Thriller" {
                        tempList.append(movie.movieTitle)
                    }
                }
                if !(tempList.isEmpty) {
                    return tempList.randomElement()!
                } else {
                    return (movieSelection.randomElement()?.movieTitle)!
                }
            }
            
        case "cloudy":
            if currTime == "morning" {
                for movie in movieSelection {
                    if movie.genre == "Animation" || movie.genre == "Documentary" {
                        tempList.append(movie.movieTitle)
                    }
                }
                if !(tempList.isEmpty) {
                    return tempList.randomElement()!
                } else {
                    return (movieSelection.randomElement()?.movieTitle)!
                }
            } else if currTime == "afternoon" {
                for movie in movieSelection {
                    if movie.genre == "Science Fiction" {
                        tempList.append(movie.movieTitle)
                    }
                }
                    if !(tempList.isEmpty) {
                        return tempList.randomElement()!
                    } else {
                        return (movieSelection.randomElement()?.movieTitle)!
                    }
            } else {
                for movie in movieSelection {
                    if movie.genre == "War" {
                        tempList.append(movie.movieTitle)
                    }
                }
                if !(tempList.isEmpty) {
                    return tempList.randomElement()!
                } else {
                    return (movieSelection.randomElement()?.movieTitle)!
                }
            }
            
        default:
            return defaultMovie
        }
    }
}
