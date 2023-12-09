//
//  WatchListView.swift
//  TV-Rating-App
//
//  Created by Luc Rieffel on 12/7/23.
//

import Foundation
import SwiftUI

struct WatchListView: View {
    @ObservedObject var multimediaStore: MultimediaStore
    
    private var watchlistMovies: [Multimedia] {
        multimediaStore.multimedias.filter { $0.isMovie }
    }

    private var watchlistTVShows: [Multimedia] {
        multimediaStore.multimedias.filter { $0.isTVShow }
    }

    var body: some View {
        NavigationView {
            
            List {
                SectionHeading(title: "Movies Watchlist")
                
                ForEach(multimediaStore.multimedias.filter { $0.isWatchlist && $0.isMovie }) { multimedia in
                    ListCell(multimedia: multimedia)
                        .padding(.vertical, 8)
                }
                
                SectionHeading(title: "TV Shows Watchlist")

                ForEach(multimediaStore.multimedias.filter { $0.isWatchlist && $0.isTVShow }) { multimedia in
                    ListCell(multimedia: multimedia)
                        .padding(.vertical, 8)
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            
            List {
                SectionHeading(title: "Movies Watchlist")
                
                ForEach(multimediaStore.multimedias.filter { $0.isWatchlist && $0.isMovie }) { multimedia in
                    ListCell(multimedia: multimedia)
                        .padding(.vertical, 8)
                }
                
                SectionHeading(title: "TV Shows Watchlist")

                ForEach(multimediaStore.multimedias.filter { $0.isWatchlist && $0.isTVShow }) { multimedia in
                    ListCell(multimedia: multimedia)
                        .padding(.vertical, 8)
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Watchlist")
            .navigationBarItems(leading: NavigationLink(destination: AddNewMultiMedia(multimediaStore: multimediaStore).navigationBarTitle("Add to Watchlist", displayMode: .inline)) {
                Image(systemName: "plus")
                    .imageScale(.large)
                    .foregroundColor(.blue)
            }, trailing: EditButton())
        }
    }

    func deleteItems(at offsets: IndexSet) {
        multimediaStore.multimedias.remove(atOffsets: offsets)
    }

    func moveItems(from source: IndexSet, to destination: Int) {
        multimediaStore.multimedias.move(fromOffsets: source, toOffset: destination)
    }
}

struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListView(multimediaStore: MultimediaStore(multimedias: MultimediaData))
    }
}

// Assuming ListCell and Multimedia struct are defined in your project
