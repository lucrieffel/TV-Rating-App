//
//  AddNewMultimediaToWatchlist.swift
//  TV-Rating-App
//
//  Created by Keshia Suwitra on 12/9/23.
//

import SwiftUI
import Foundation

struct AddNewMultimediaToWatchlist: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var multimediaStore : MultimediaStore
    @State private var mediaTitle = ""
    @State private var dateWatched = ""
    @State private var mediaGenre = ""
    @State private var mediaDirector = ""
    @State private var isMovie = false
    @State private var isTVShow = false
    @State private var userRating = 0.0
    @State private var isWatched = false
    @State private var isRecommended = false
    @State private var isWatchlist = true
    
    var body: some View {
        Form {
            Section(header: Text("Details")) {
                DataInput(title: "Title: ", userInput: $mediaTitle)
                DataInput(title: "Genre: ", userInput: $mediaGenre)
                DataInput(title: "Director: ", userInput: $mediaDirector)
                Toggle(isOn: $isMovie) {
                    Text("Movie?").font(.headline)
                }.padding()
                Toggle(isOn: $isTVShow) {
                    Text("TVShow?").font(.headline)
                }.padding()
            }
            Button(action: addNewMedia) {
                Text("Add Media to Watchlist")
            }
        }
    }
    
    func addNewMedia(){
        let newMultimedia = Multimedia(
            id: UUID().uuidString,
            mediaTitle: mediaTitle,
            dateWatched: dateWatched,
            mediaGenre: mediaGenre,
            mediaDirector: mediaDirector,
            isMovie: isMovie,
            isTVShow: isTVShow,
            userRating: userRating,
            imageName: "", isWatched: isWatched, isRecommended: isRecommended, isWatchlist: isWatchlist)
        
        multimediaStore.multimedias.append(newMultimedia)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddNewMultimediaToWatchlist_Preview: PreviewProvider {
    static var previews: some View {
        AddNewMultimediaToWatchlist(multimediaStore: MultimediaStore(multimedias: MultimediaData))
    }
}
