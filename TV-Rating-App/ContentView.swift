//
//  ContentView.swift
//  TV-Rating-App
//
//  Created by Luc Rieffel on 12/3/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject private var multimediaStore: MultimediaStore = MultimediaStore(multimedias: MultimediaData)

    var body: some View {
        TabView {
            // First Tab: Recommended Movies (previously second tab)
            MoviePostersView()
                .tabItem {
                    Label("Recommended", systemImage: "film")
                }

            // Second Tab: Currently Watched Movies and Shows (previously first tab)
            NavigationView {
                List {
                    ForEach(multimediaStore.multimedias) { multimedia in
                        ListCell(multimedia: multimedia)
                            .padding(.vertical, 8)
                    }
                    .onDelete(perform: deleteItems)
                    .onMove(perform: moveItems)
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle("My Movies and Shows")
                .navigationBarItems(leading: NavigationLink(destination: AddNewMultiMedia(multimediaStore: self.multimediaStore).navigationBarTitle("Add Media", displayMode: .inline)) {
                    Image(systemName: "plus")
                        .imageScale(.large)
                        .foregroundColor(.blue)
                }, trailing: EditButton())
            }
            .tabItem {
                Label("My List", systemImage: "list.dash")
            }

            // Third Tab: Watchlist
            WatchListView()
                .tabItem {
                    Label("Watchlist", systemImage: "bookmark")
                }
        }
    }

    func deleteItems(at offsets: IndexSet) {
        multimediaStore.multimedias.remove(atOffsets: offsets)
    }

    func moveItems(from source: IndexSet, to destination: Int) {
        multimediaStore.multimedias.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListCell: View {
    var multimedia: Multimedia

    var body: some View {
        NavigationLink(destination: MultimediaDetail(selectedMultimedia: multimedia)) {
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
