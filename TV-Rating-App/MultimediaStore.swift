//
//  MultimediaStore.swift
//  TV-Rating-App
//
//  Created by Luc Rieffel on 12/5/23.
//

import Foundation
import SwiftUI
import Combine


class MultimediaStore : ObservableObject {
    @Published var multimedias: [Multimedia]
    init (multimedias: [Multimedia] = []) {
        self.multimedias = multimedias
    }
}
