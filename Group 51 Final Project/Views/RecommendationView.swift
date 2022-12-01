import SwiftUI
//import WeatherKit
//import CoreLocation

let currDate = getCurrentDate()
let currTime = getCurrentTime()
let currWeather = getCurrentWeather()

struct RecommendationView: View {
    var movieModel: MovieModel!
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.indigo, .teal], startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Your movie recommendation is:").padding()
                    if !(movieModel.movieList.isEmpty) {
                        Text(getMovieRecommendation(movieList: movieModel))
                    } else {
                        Text(defaultMovie)
                    }
                }
            }
        }
    }
}

struct RecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationView()
    }
}
