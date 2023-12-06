//
//  MultimediaDetail.swift
//  TV-Rating-App
//
//  Created by Luc Rieffel on 12/5/23.
//

import Foundation
import SwiftUI

struct MultimediaDetail: View {
    let selectedMultimedia: Multimedia
    @State private var colorIndex = 0
//    //define array of colors to randomly choose from
//    let colors: [Color] = [.black, .red, .blue, .green, .purple, .orange]
    var body: some View {
        Form {
            Section(header: Text("Media Details").font(.largeTitle).padding()) {
                VStack(alignment: .leading, spacing: 5) {
                    Label("Title: \(selectedMultimedia.mediaTitle)", systemImage: "movie")
                        .font(.headline)
                    Label("Genre: \(selectedMultimedia.mediaGenre)", systemImage: "text.book.closed")
                        .font(.headline)

                    Label("Date Watched: \(selectedMultimedia.dateWatched)", systemImage: "date")
                        .font(.headline)
                    Label("Director: \(selectedMultimedia.mediaDirector)", systemImage: "doc.text")
                        .font(.headline)
                    HStack {
                        Text("Movie")
                            .font(.headline)
                        Spacer()
                        Image(systemName: selectedMultimedia.isMovie ? "checkmark.circle" : "xmark.circle" )
                            .foregroundColor(selectedMultimedia.isMovie ? .green : .red)
                        Text("TV Show")
                            .font(.headline)
                        Spacer()
                        Image(systemName: selectedMultimedia.isTVShow ? "checkmark.circle" : "xmark.circle" )
                            .foregroundColor(selectedMultimedia.isTVShow ? .green : .red)
                    }
                    .padding(.top, 10)
                }
                .padding(.vertical)
                .foregroundColor(.black)
                .font(.headline)
                .padding(.top, 20)
            }
            .padding(.top)
        }
        .navigationBarTitle("Assignment Detail", displayMode: .inline)
    }
}

struct AssignmentDetail_Preview: PreviewProvider {
    static var previews: some View {
        MultimediaDetail(selectedMultimedia: MultimediaData[0])
    }
}
