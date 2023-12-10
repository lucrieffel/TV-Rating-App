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
    @ObservedObject var multimediaStore: MultimediaStore
    // variable that filters conditions watchlist and movie
    private var watchlistMovies: [Multimedia] {
        multimediaStore.multimedias.filter { $0.isWatchlist && $0.isMovie }
    }
    // variable that filters conditions watchlist and tv show
    private var watchlistTVShows: [Multimedia] {
        multimediaStore.multimedias.filter { $0.isWatchlist && $0.isTVShow }
    }
    var body: some View {
        NavigationView {
            List {
                //Movies Section
                Section(header: Text("MOVIES").font(.system(.title2, design: .rounded))) {
                    ForEach(watchlistMovies) { multimedia in
                        ListCell(multimedia: multimedia)
                            .padding(.vertical, 8)
                    }
                    //Delete movies(function listed below)
                    .onDelete(perform: { offsets in
                        deleteItems(at: offsets, from: watchlistMovies)
                    })
                    .onMove(perform: moveItems)
                }
                //TV Shows Section
                Section(header: Text("TV SHOWS").font(.system(.title2, design: .rounded))) {
                    ForEach(watchlistTVShows) { multimedia in
                        ListCell(multimedia: multimedia)
                            .padding(.vertical, 8)
                    }
                    //delete tv shows(using function)
                    .onDelete(perform: { offsets in
                        deleteItems(at: offsets, from: watchlistTVShows)
                    })
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
    //delete items from list function(using index)
    func deleteItems(at offsets: IndexSet, from items: [Multimedia]) {
        let idsToDelete = offsets.map { items[$0].id }
        multimediaStore.multimedias.removeAll(where: { idsToDelete.contains($0.id) })
    }
    // move items in list function
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
