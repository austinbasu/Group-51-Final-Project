//
//  AddMovieView.swift
//  CSE335 Project
//
//  Created by Jacob Ong on 10/22/22.
//

import SwiftUI

struct AddMovieView: View {
    @State var movieName: String = ""
    @State var movieModel: MovieModel!
    var body: some View {
        Text("Add Movie")
        TextField("Please Enter Movie Name", text: $movieName).textFieldStyle(RoundedBorderTextFieldStyle()).foregroundColor(Color.blue)
        Button("Add") {
            if (movieName != "")
            {
                movieModel.addToMovieList(movieName: movieName)
            }
        }
    }
}

struct AddMovieView_Previews: PreviewProvider {
    static var previews: some View {
        AddMovieView()
    }
}
