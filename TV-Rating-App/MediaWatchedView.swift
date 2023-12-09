//
//  TVShowWatchlistView.swift
//  TV-Rating-App
//
//  Created by Keshia Suwitra on 12/9/23.
//

import SwiftUI

struct MediaWatchedView: View {
    @ObservedObject var multimediaStore: MultimediaStore
    
    private var watchedMovies: [Multimedia] {
        multimediaStore.multimedias.filter { $0.isMovie }
    }

    private var watchedTVShows: [Multimedia] {
        multimediaStore.multimedias.filter { $0.isTVShow }
    }
    
    var body: some View {
        NavigationView {
            List {
                SectionHeading(title: "Movies Watched")
                
                ForEach(multimediaStore.multimedias.filter { $0.isWatched && $0.isMovie }) { multimedia in
                    ListCell(multimedia: multimedia)
                        .padding(.vertical, 8)
                }
                
                SectionHeading(title: "TV Shows Watched")

                ForEach(multimediaStore.multimedias.filter { $0.isWatched && $0.isTVShow }) { multimedia in
                    ListCell(multimedia: multimedia)
                        .padding(.vertical, 8)
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
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
    
    func deleteItems(at offsets: IndexSet) {
        multimediaStore.multimedias.remove(atOffsets: offsets)
    }

    func moveItems(from source: IndexSet, to destination: Int) {
        multimediaStore.multimedias.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    MediaWatchedView(multimediaStore: MultimediaStore(multimedias: MultimediaData))
}
