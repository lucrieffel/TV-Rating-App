//
//  NewMultimedia.swift
//  TV-Rating-App
//
//  Created by Luc Rieffel on 12/5/23.
//

import Foundation
import SwiftUI

struct AddNewMultiMedia: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var multimediaStore : MultimediaStore
    @State private var mediaTitle = ""
    @State private var dateWatched = ""
    @State private var mediaGenre = ""
    @State private var mediaDirector = ""
    @State private var isMovie = true
    @State private var isTVShow = false
    @State private var userRating = 0.0
    
    var body: some View {
        Form {
            Section(header: Text("Details")) {
                DataInput(title: "Title: ", userInput: $mediaTitle)
                DataInput(title: "Date Watched(yyyy-mm-dd): ", userInput: $dateWatched)
                DataInput(title: "Genre: ", userInput: $mediaGenre)
                DataInput(title: "Director: ", userInput: $mediaDirector)
                Toggle(isOn: $isMovie) {
                    Text("Movie?").font(.headline)
                }.padding()
                Toggle(isOn: $isTVShow) {
                    Text("TVShow?").font(.headline)
                }.padding()
                DataInputDouble(title: "Rating: ", userInput: $userRating)
            }
            Button(action: addNewAssignment) {
                Text("Add Media")
            }
        }
    }
    func addNewAssignment(){
        let newMultimedia = Multimedia(
            id: UUID().uuidString,
            mediaTitle: mediaTitle,
            dateWatched: dateWatched,
            mediaGenre: mediaGenre,
            mediaDirector: mediaDirector,
            isMovie: isMovie,
            isTVShow: isTVShow,
            userRating: userRating
        )
        multimediaStore.multimedias.append(newMultimedia)
        presentationMode.wrappedValue.dismiss()
    }
}

struct DataInput: View {
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

struct AddNewMultimedia_Preview: PreviewProvider {
    static var previews: some View {
        AddNewMultiMedia(multimediaStore: MultimediaStore(multimedias: MultimediaData))
    }
}

//struct for inputting a double type into our ratings table
struct DataInputDouble: View {
    var title: String
    @Binding var userInput: Double
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", value: $userInput, format: .number)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}
