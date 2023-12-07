//
//  MoviePostersView.swift
//  TV-Rating-App
//
//  Created by Luc Rieffel on 12/6/23.
//

import Foundation
import SwiftUI

struct MoviePostersView: View {
    var posters = ["forest_gump_poster", "pulp_fiction_poster", "s_list", "The_Godfather_poster", "the_shawshank_redemption_poster"]
    
    var body: some View {
        //Add Title for Recommended Movies
        ScrollView (.horizontal){
            HStack {
                HStack{
                    Text("Movies").font(.title)
                    ForEach(posters, id: \.self) { posterName in
                        //add posters who are movies in this section
                        Image(posterName)
                            .resizable()
                            .frame(width: 200, height: 200)
                            .padding()
                    }
                    Text("TV Shows").font(.title)
                    ForEach(posters, id: \.self) { posterName in
                        //add posters who are TV Shows here
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
