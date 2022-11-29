import SwiftUI
import WeatherKit
import CoreLocation

let halloweenMovieList = ["The Shining", "Psycho", "The Silence of the Lambs", "The Exorcist", "Friday the 13th", "A Nightmare on Elm Street", "Scream", "Halloween", "Donnie Darko", "It"]
let christmasMovieList = ["Die Hard", "Elf", "Home Alone", "A Christmas Carol", "It's a Wondeful Life", "How the Grinch Stole Christmas", "A Charlie Brown Christmas", "Miracle on 34th Street", "Citizen Kane", "National Lampoons's Christmas Vacation"]

let currDate = getCurrentDate()
let currTime = getCurrentTime()
let currWeather = getCurrentWeather()
var recommendedMovie = getMovieRecommendation()

struct RecommendationView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.indigo, .teal], startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Movie Recommendation")
                        .offset(y: -350)
                        .font(.system(size: 24))
                    //Text(currDate)
                    //Text(currTime)
                    Text(recommendedMovie)
                }
            }
        }
    }
}

func getCurrentWeather() -> String {
    return ""
}

func getCurrentDate() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM.dd"
    return formatter.string(from: Date())
}

func getCurrentTime() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH"
    return formatter.string(from: Date())
}

func getMovieRecommendation() -> String {
    if currDate == "10.31" {
        return halloweenMovieList.randomElement()!
    } else if currDate == "12.25" {
        return christmasMovieList.randomElement()!
    } else {
        if currWeather == "Cloudy" {
            return "cloudy movie"
        } else if currWeather == "Sunny" {
            return "Sunny movie"
        } else {
            return "2001: A Space Odyssey"
        }
    }
}

struct RecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationView()
    }
}
