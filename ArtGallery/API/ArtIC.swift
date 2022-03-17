//
//  ArtIC.swift
//  ArtGallery
//
//  Created by Makena Robison on 3/7/22.
//

import Foundation

let ARTIC_ROOT = "https://api.artic.edu/api/v1"
let ARTIC_ENDPOINT = "\(ARTIC_ROOT)/artworks"
let IIIF_ROOT = "https://www.artic.edu/iiif/2/"

enum ArtICAPIError: Error {
    case artworkNotFound
    case unexpectedAPIError
}
func getArtwork(id: Int) async throws -> Artwork {
    guard let url = URL(string: "\(ARTIC_ENDPOINT)/\(id)") else {
        fatalError("Should never happen, but just in case…URL didn’t work 😔")
    }
    let (data, _) = try await URLSession.shared.data(from: url)
    if let decodedArt = try? JSONDecoder().decode(ArtworkResult.self, from: data) {
        return decodedArt.data
    } else {
        throw ArtICAPIError.artworkNotFound
    }
}


func searchARTIC(term: String) async throws -> ArtICPage {
    guard let url = URL(string: "https://api.artic.edu/api/v1/artworks/search?q=\(term)") else {
        fatalError("Should never happen, but just in case…URL didn’t work 😔")
    }

    let (data, _) = try await URLSession.shared.data(from: url)
    if let decodedPage = try? JSONDecoder().decode(ArtICPage.self, from: data) {
        return decodedPage
    } else {
        throw ArtICAPIError.artworkNotFound
    }
}


