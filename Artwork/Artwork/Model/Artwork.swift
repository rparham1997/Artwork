//
//  Artwork.swift
//  Artwork
//
//  Created by Ramar Parham on 7/27/23.
//

import Foundation

struct ArtworkDataResponse: Decodable {
    let data: [Artwork]
}

struct Artwork: Decodable, Identifiable {
    let id: Int
    let title: String
    let imageId: String?
}

let previewArtwork = Artwork(id: 16487, title: "The Bay of Marseille, Seen from L\'Estaque", imageId: "d4ca6321-8656-3d3f-a362-2ee297b2b813")
