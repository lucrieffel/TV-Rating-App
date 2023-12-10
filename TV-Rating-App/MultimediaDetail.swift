//
//  MultimediaDetail.swift
//  TV-Rating-App
//
//  Created by Luc Rieffel on 12/5/23.
//

import Foundation
import SwiftUI

//structure of view type to show more details of the multimedia
struct MultimediaDetail: View {
    let selectedMultimedia: Multimedia
    @State private var colorIndex = 0
    var body: some View {
        Form {
            Section(header: Text("Media Details").font(.largeTitle).padding()) {
                VStack(alignment: .leading, spacing: 3) {
                    Label(selectedMultimedia.mediaTitle, systemImage: "movie")
                        .font(.title2)
                    Spacer()
                    Label("Genre: \(selectedMultimedia.mediaGenre)", systemImage: "film")
                        .font(.subheadline)
                    Label("Date Watched: \(selectedMultimedia.dateWatched)", systemImage: "calendar")
                        .font(.subheadline)
                    Label("Director: \(selectedMultimedia.mediaDirector)", systemImage: "person")
                        .font(.subheadline)
                    Label("My Rating: \(selectedMultimedia.userRating)", systemImage: "star")
                        .font(.subheadline)
                    HStack {
                        Text("Movie")
                            .font(.subheadline)
                        Image(systemName: selectedMultimedia.isMovie ? "checkmark.circle" : "xmark.circle" )
                            .foregroundColor(selectedMultimedia.isMovie ? .green : .red)
                        Text("TV Show")
                            .font(.subheadline)
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
        .navigationBarTitle("Media Detail", displayMode: .inline)
    }
}

struct AssignmentDetail_Preview: PreviewProvider {
    static var previews: some View {
        MultimediaDetail(selectedMultimedia: MultimediaData[0])
    }
}
