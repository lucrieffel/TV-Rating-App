//
//  Multimedia.swift
//  TV-Rating-App
//
//  Created by Luc Rieffel on 12/5/23.
//

import Foundation
import SwiftUI

struct Multimedia: Codable, Identifiable{
    var id: String
    var mediaTitle: String
    var mediaContentRating: String
    var isMovie: Bool
    var isTVShow: Bool
    var userRating: Float
    var mediaDirector: String
    var mediaProducer: String
}
