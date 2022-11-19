import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(colors: [.indigo, .teal], startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    NavigationLink(destination: RecommendationView(), label: {
                        Text("Movie Recommendation")
                            .frame(width: 200, height: 50, alignment: .center)
                            .background(Color.white)
                            .foregroundColor(.blue)
                            .clipShape(Capsule())
                            .padding(.all)
                            .navigationTitle("Dashboard")
                    }).offset(y: -75)
                    NavigationLink(destination: RecommendationView(), label: {
                        Text("Movie List")
                            .frame(width: 200, height: 50, alignment: .center)
                            .background(Color.white)
                            .foregroundColor(.blue)
                            .clipShape(Capsule())
                            .padding(.all)
                    }).offset(y: -50)
                    NavigationLink(destination: RecommendationView(), label: {
                        Text("Watchlist")
                            .frame(width: 200, height: 50, alignment: .center)
                            .background(Color.white)
                            .foregroundColor(.blue)
                            .clipShape(Capsule())
                            .padding(.all)
                    }).offset(y: -25)
                    Spacer()
                }
            }
        }.accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
