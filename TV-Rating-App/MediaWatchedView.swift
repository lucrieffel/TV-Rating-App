//
//  TVShowWatchlistView.swift
//  TV-Rating-App
//
//  Created by Keshia Suwitra on 12/9/23.
//
import SwiftUI

//Create a structure for Watched Shows and Movies
struct MediaWatchedView: View {
    @ObservedObject var multimediaStore: MultimediaStore
    //filter unwatched movies
    private var watchedMovies: [Multimedia] {
        multimediaStore.multimedias.filter { $0.isWatched && $0.isMovie }
    }
    //filter unwatched shows
    private var watchedTVShows: [Multimedia] {
        multimediaStore.multimedias.filter { $0.isWatched && $0.isTVShow }
    }
    
    var body: some View {
        NavigationView {
            List {
                //Movies Section
                Section(header: Text("MOVIES").font(.system(.title2, design: .rounded))) {
                    ForEach(watchedMovies) { multimedia in
                        ListCell(multimedia: multimedia)
                            .padding(.vertical, 8)
                    }
                    .onDelete(perform: { offsets in
                        deleteItems(at: offsets, from: watchedMovies)
                    })
                    .onMove(perform: moveItems)
                }
                //TV Shows Section
                Section(header: Text("TV SHOWS").font(.system(.title2, design: .rounded))) {
                    ForEach(watchedTVShows) { multimedia in
                        ListCell(multimedia: multimedia)
                            .padding(.vertical, 8)
                    }
                    .onDelete(perform: { offsets in
                        deleteItems(at: offsets, from: watchedTVShows)
                    })
                    .onMove(perform: moveItems)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("My Movies and Shows")
            .navigationBarItems(leading: NavigationLink(destination: AddNewMultiMedia(multimediaStore: self.multimediaStore)) {
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

//Show Preview
#Preview {
    MediaWatchedView(multimediaStore: MultimediaStore(multimedias: MultimediaData))
}
