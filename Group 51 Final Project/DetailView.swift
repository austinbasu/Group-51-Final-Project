//
//  DetailView.swift
//  CSE335 Project
//
//  Created by Jacob Ong on 10/22/22.
//

import SwiftUI

struct DetailView: View {
    var title: String?
    var descr: String?
    var rating: Double?
    var releaseDate: String?
    var body: some View {
        Text("Movie information")
        VStack(alignment: .center)
        {
            Text("\(title!)").font(.largeTitle).bold().foregroundColor(Color.purple)
            Spacer()
            Text("Overview: \(descr!)")
            Spacer()
            Text("Rating: \(rating!)")
            Spacer()
            Text("Released on \(releaseDate!)")

        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
