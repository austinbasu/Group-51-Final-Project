import SwiftUI

struct WatchListView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.indigo, .teal], startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Watch List")
                        .offset(y: -350)
                        .font(.system(size: 24))
                }
            }
        }
    }
}

struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListView()
    }
}
