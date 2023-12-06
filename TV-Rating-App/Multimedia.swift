//
//  Multimedia.swift
//  TV-Rating-App
//
//  Created by Luc Rieffel on 12/5/23.
//

import Foundation
import SwiftUI

struct Multimedia: Codable, Identifiable{
    var id: String //id of media
    
    var mediaTitle: String //name of the movie/tv show
    
    var dateWatched: String //modify to a date or calendar drop down if necessary
    
    var mediaGenre: String // picker drop down menu

    var mediaDirector: String //director of movie/tv show
    
    var isMovie: Bool // slider to indicate it was a movie
    
    var isTVShow: Bool// slider to indicate it was a TV Show
    
    var userRating: Double //Users numerical/float rating 1.0-5.0 of the media
    
    var imageName: String = "movie_clips" // name of the image in "Assets", default is a blank image

//
//    var mediaContentRating: String //PG-13, R, etc.
}
