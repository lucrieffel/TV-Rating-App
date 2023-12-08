//
//  MoviePostersView.swift
//  TV-Rating-App
//
//  Created by Luc Rieffel on 12/6/23.
//

import Foundation
import SwiftUI

struct MoviePostersView: View {
    var moviePosters = ["forest_gump_poster", "pulp_fiction_poster", "s_list", "The_Godfather_poster", "the_shawshank_redemption_poster"]
    var tvShowPosters = ["tv_show_poster1", "tv_show_poster2", "tv_show_poster3"] // Add your TV show poster names here

    var body: some View {
        VStack {
            // Heading for the Recommended section
            Text("Recommended")
                .font(.largeTitle)
                .padding(5)
            Spacer()

            // Movies Section
            Text("Movies").font(.title)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(moviePosters, id: \.self) { posterName in
                        Image(posterName)
                            .resizable()
                            .frame(width: 200, height: 200)
                            .padding()
                    }
                }
            }

            // TV Shows Section
            Text("TV Shows").font(.title)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(tvShowPosters, id: \.self) { posterName in
                        Image(posterName)
                            .resizable()
                            .frame(width: 200, height: 200)
                            .padding()
                    }
                }
            }
        }
        .navigationBarTitle("Recommended Movies", displayMode: .inline)
    }
}

