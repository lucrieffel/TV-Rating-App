//
//  ContentView.swift
//  TV-Rating-App
//
//  Created by Luc Rieffel on 12/3/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //State object referencing to the dataset of multimedia that we have made of movies and tv shows
    @StateObject private var multimediaStore = MultimediaStore(multimedias: MultimediaData)

    var body: some View {
        
        TabView {
            // First Tab: Recommended Movies
            MoviePostersView(multimediaStore: multimediaStore)
                .tabItem {
                    Label("Recommended", systemImage: "film")
                }

            // Second Tab: My Watched Movies and Shows
            MediaWatchedView(multimediaStore: multimediaStore)
                .tabItem {
                    Label("My Movies & Shows", systemImage: "movieclapper")
                }

            // Third Tab: Watchlist: Movies the user wants to watch
            WatchListView(multimediaStore: multimediaStore)
                .tabItem {
                    Label("Watchlist", systemImage: "eye")
                }
        }
    }
}

//show preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//Structure to define what will be displayed in each listcell,
struct ListCell: View {
    var multimedia: Multimedia
    var body: some View {
        NavigationLink(destination: MultimediaDetail(selectedMultimedia: multimedia)) {
            //make hstack and vstack to display genre, date watched, and rating(for watchlist and my movies/shows)
            HStack {
                Image(multimedia.imageName) // Display the image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipped()
                    .cornerRadius(8)

                VStack(alignment: .leading) {
                    Text(multimedia.mediaTitle)
                        .font(.headline)
                    Text("Genre: \(multimedia.mediaGenre)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("Date Watched: \(multimedia.dateWatched)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("Rating: \(String(format: "%.1f", multimedia.userRating))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal, 8)
        }
    }
}
