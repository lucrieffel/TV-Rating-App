//
//  MultimediaStore.swift
//  TV-Rating-App
//
//  Created by Luc Rieffel on 12/5/23.
//

import SwiftUI
import Combine

//create a class to store data from multimedia_data dataset
class MultimediaStore : ObservableObject {
    @Published var multimedias: [Multimedia]
    
    init (multimedias: [Multimedia] = []) {
        self.multimedias = multimedias
    }
}
