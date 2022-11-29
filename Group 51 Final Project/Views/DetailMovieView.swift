//
//  DetailView.swift
//  CSE335 Project
//
//  Created by Jacob Ong on 10/22/22.
//

import SwiftUI

struct DetailMovieView: View {
    var title: String?
    var descr: String?
    var rating: Double?
    var releaseDate: String?
    var genre: String?
    var body: some View {
        Text("Movie information")
        VStack(alignment: .center)
        {
            Text("\(title!)").font(.largeTitle).bold().foregroundColor(Color.purple)
            Spacer()
            Text("Genres: \(genre!)")
            Spacer()
            Text("Overview: \(descr!)")
            Spacer()
            Text("Rating: \(rating!)")
            Text("Released on \(releaseDate!)")
            Spacer()

        }
    }
}

struct DetailMovieView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMovieView()
    }
}
