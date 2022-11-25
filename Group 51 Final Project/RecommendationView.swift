import SwiftUI
import WeatherKit
import CoreLocation

struct RecommendationView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.indigo, .teal], startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Movie Recommendation")
                        .offset(y: -350)
                        .font(.system(size: 24))
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
