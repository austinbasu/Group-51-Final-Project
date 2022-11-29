//
//  AddMovieWatchListView.swift
//  Group 51 Final Project
//
//  Created by joey Warrick on 11/28/22.
//

import Foundation
import SwiftUI

struct AddMovieWatchListView: View {
    @State var movieName: String = ""
    @State var yourRating: String = ""
    @State var yourRatingCon: Double = 0
    @State var movieModel: MovieModel!
    var body: some View {
        Text("Add Movie")
        TextField("Please Enter Movie Name", text: $movieName).textFieldStyle(RoundedBorderTextFieldStyle()).foregroundColor(Color.blue)
        TextField("Please Enter your movie rating", text: $yourRating).textFieldStyle(RoundedBorderTextFieldStyle()).foregroundColor(Color.blue)
        Button("Add") {
            if (movieName != "")
            {
                yourRatingCon = Double(yourRating) ?? 5.0
                movieModel.addToWatchList(movieName: movieName, yourRatingCon: Double(yourRating)!)
            }
        }
    }
}

struct AddMovieWatchListView_Previews: PreviewProvider {
    static var previews: some View {
        AddMovieWatchListView()
    }
}
