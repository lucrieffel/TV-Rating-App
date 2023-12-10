//
//  MoviePostersView.swift
//  TV-Rating-App
//
//  Created by Luc Rieffel on 12/6/23.
//

import Foundation
import SwiftUI

//structure called movieposters view but this was later developed to be the recommended tab
struct MoviePostersView: View {
    @ObservedObject var multimediaStore: MultimediaStore
    private var recommendedMovies: [Multimedia] {
        multimediaStore.multimedias.filter { $0.isRecommended && $0.isMovie }
    }
    private var recommendedTVShows: [Multimedia] {
        multimediaStore.multimedias.filter { $0.isRecommended && $0.isTVShow }
    }

    var body: some View {
        VStack {
            // Heading for the Recommended section
            Text("WatchRater")
                .font(.largeTitle)
                .padding(5)
            
            Text("Recommended For You")
                .font(.title)
                .padding(5)
            Spacer()
            // Movies Section
            SectionHeading(title: "Movies")
            ScrollView(.horizontal) {
                HStack {
                    ForEach(recommendedMovies, id: \.id) { media in
                        Image(media.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .padding()
                    }
                }
            }
            // TV Shows Section
            SectionHeading(title: "TV Shows")
            ScrollView(.horizontal) {
                HStack {
                    ForEach(recommendedTVShows, id: \.id) { media in
                        Image(media.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .padding()
                    }
                }
            }
        }
        .navigationBarTitle("Recommended Movies", displayMode: .inline)
    }
}

//Create a structure to add a heading to the view
struct SectionHeading: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title)
            .padding(.vertical, 5)
    }
}

//Show Preview
#Preview {
    MoviePostersView(multimediaStore: MultimediaStore(multimedias: MultimediaData))
}
