//
//  WatchListView.swift
//  TV-Rating-App
//
//  Created by Luc Rieffel on 12/7/23.
//

import Foundation
import SwiftUI

struct WatchListView: View {
    @StateObject private var multimediaStore: MultimediaStore = MultimediaStore(multimedias: MultimediaData)

    var body: some View {
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
            .navigationBarTitle("Watchlist")
            .navigationBarItems(leading: NavigationLink(destination: AddNewMultiMedia(multimediaStore: self.multimediaStore).navigationBarTitle("Add to Watchlist", displayMode: .inline)) {
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
        WatchListView()
    }
}

// Assuming ListCell and Multimedia struct are defined in your project
