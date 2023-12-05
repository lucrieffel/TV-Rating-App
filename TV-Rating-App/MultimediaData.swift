//
//  MultimediaData.swift
//  TV-Rating-App
//
//  Created by Luc Rieffel on 12/5/23.
//

import Foundation
import SwiftUI

var MultimediaData: [Multimedia] = loadJson("Multimedia_Data.json")

func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename,
                                     withExtension: nil)
    else {
        fatalError("\(filename) not found.")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): \(error)")
    }
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): \(error)")
    }
}
