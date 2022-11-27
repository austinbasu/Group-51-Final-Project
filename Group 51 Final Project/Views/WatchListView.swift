import SwiftUI

struct WatchListView: View {
    @ObservedObject var movieModel = MovieModel()
    var body: some View {
        NavigationView {
            
            VStack(alignment: .center) {
                List {
                    ForEach(movieModel.movieList, id: \.self) { movie in
                        Text("\(movie.movieTitle!)")
                        Text("\(movie.rating!)")
                        NavigationLink("View Movie", destination:DetailMovieView(title: movie.movieTitle, descr: movie.description, rating: movie.rating, releaseDate: movie.releaseDate))
                    }
                }
            }
        .navigationTitle("My Watched Movies").navigationBarTitleDisplayMode(.inline)
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
            }
        }
        }
            
            
//            ZStack {
//                LinearGradient(colors: [.indigo, .teal], startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
//                VStack {
//                    Text("Watch List")
//                        .offset(y: -350)
//                        .font(.system(size: 24))
//                }
//            }
       // }
    }
}

struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListView()
    }
}
