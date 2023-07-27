//
//  ArtworkView.swift
//  Artwork
//
//  Created by Ramar Parham on 7/27/23.
//

import SwiftUI

struct ArtworkView: View {
    let artwork: Artwork
    var body: some View {
        NavigationLink {
            ArtworkDetailView(artwork: artwork)
        } label: {
            Text(artwork.title)
                
        }
    }
}

struct ArtworkView_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkView(artwork: previewArtwork)
            .previewLayout(.sizeThatFits)
    }
}
