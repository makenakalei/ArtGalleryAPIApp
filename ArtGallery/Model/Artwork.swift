//
//  Artwork.swift
//  ArtGallery
//
//  Created by Makena Robison on 3/8/22.
//

import Foundation

struct ArtworkResult: Hashable, Codable {
    var data: Artwork
}
struct Artwork: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var api_link: String
    var api_model: String
    var date_display: String
    var artist_title: String
    var image_id: String

    func getPrintLink (size: String) -> URL {
        guard let url = URL(string: "\(IIIF_ROOT)/\(self.image_id)/full/\(size),/0/default.jpg") else {
            fatalError("Should never happen, but just in case…URL didn’t work 😔")
        }
       return url
    }
}

struct ArtworkSearched: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var api_link: String
}

struct ArtICPage: Hashable, Codable {
    var data: [ArtworkSearched]
}
