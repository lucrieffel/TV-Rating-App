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
            // Main Heading
            Text("WatchRater")
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .foregroundColor(.blue)
                .padding(.top, 20)

            Text("Recommended For You")
                .font(.system(size: 24, weight: .medium, design: .serif))
                .padding(.bottom, 80)
            

            // Movies Section
            SectionHeading(title: "Movies")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(recommendedMovies, id: \.id) { media in
                        Image(media.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }
                .padding(.horizontal)
            }
            // TV Shows Section
            SectionHeading(title: "TV Shows")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(recommendedTVShows, id: \.id) { media in
                        Image(media.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitle("Recommended Movies", displayMode: .inline)
        .padding(.bottom, 10)
    }
}
//structure to create section heading for movies and shows
struct SectionHeading: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 22, weight: .semibold, design: .rounded)) // Change the size as needed
            .padding(.vertical, 5)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.horizontal, 10)
            .underline()
    }
}
//Show Preview
#Preview {
    MoviePostersView(multimediaStore: MultimediaStore(multimedias: MultimediaData))
}
