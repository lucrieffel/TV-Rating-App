//
//  WatchListView.swift
//  TV-Rating-App
//
//  Created by Luc Rieffel on 12/7/23.
//

import Foundation
import SwiftUI

//structure that is of a view type, this will contain our watchlist
struct WatchListView: View {
    //reference the multimediaStore dataset
    @ObservedObject var multimediaStore: MultimediaStore
    
    //create variables to separate movies and tv shows
    private var watchlistMovies: [Multimedia] {
        multimediaStore.multimedias.filter { $0.isMovie }
    }
    private var watchlistTVShows: [Multimedia] {
        multimediaStore.multimedias.filter { $0.isTVShow }
    }
    //create the navigation view
    var body: some View {
        NavigationView {
            
            List {
                Section(header:
                    Text("MOVIES").font(.system(.title2, design: .rounded))

                ) {
                    //loop through Movies
                    ForEach(multimediaStore.multimedias.filter { $0.isWatchlist && $0.isMovie }) { multimedia in
                        ListCell(multimedia: multimedia)
                            .padding(.vertical, 8)
                    }
                    
                    .onDelete(perform: deleteItems)
                    .onMove(perform: moveItems)
                }
                Section(header: Text("TV SHOWS").font(.system(.title2, design: .rounded))
                ) {
                //loop through TV shows
                    ForEach(multimediaStore.multimedias.filter { $0.isWatchlist && $0.isTVShow }) { multimedia in
                        ListCell(multimedia: multimedia)
                            .padding(.vertical, 8)
                    }
                    .onDelete(perform: deleteItems)
                    .onMove(perform: moveItems)
                }
                
            }
            
            .listStyle(GroupedListStyle())
            .navigationBarTitle("My Watchlist")
            .navigationBarItems(leading: NavigationLink(destination: AddNewMultimediaToWatchlist(multimediaStore: multimediaStore).navigationBarTitle("Add to Watchlist", displayMode: .inline)) {
                Image(systemName: "plus")
                    .imageScale(.large)
                    .foregroundColor(.blue)
            }, trailing: EditButton())
        }
    }
    //function to delete items with edit feature
    func deleteItems(at offsets: IndexSet) {
        multimediaStore.multimedias.remove(atOffsets: offsets)
    }
    //function to move items using edit feature
    func moveItems(from source: IndexSet, to destination: Int) {
        multimediaStore.multimedias.move(fromOffsets: source, toOffset: destination)
    }
}

//show preview
struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListView(multimediaStore: MultimediaStore(multimedias: MultimediaData))
    }
}
