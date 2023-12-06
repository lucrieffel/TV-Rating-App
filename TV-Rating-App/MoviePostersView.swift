//
//  MoviePostersView.swift
//  TV-Rating-App
//
//  Created by Luc Rieffel on 12/6/23.
//

import Foundation
import SwiftUI

struct MoviePostersView: View {
    var posters = ["forest_gump_poster", "pulp_fiction_poster", "s_list", "The_Godfather_poster", "the_shawshank_redemption_poster"] // ... and so on

    var body: some View {
        ScrollView {
            VStack {
                ForEach(posters, id: \.self) { posterName in
                    Image(posterName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
            }
        }
        .navigationBarTitle("Media Posters", displayMode: .inline)
    }
}
