//
//  ContentView.swift
//  Artwork
//
//  Created by Ramar Parham on 7/27/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ArtworkViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.artworks) { artwork in
                ArtworkView(artwork: artwork)
            }
            .navigationTitle("Artworks")
            .onAppear {
                viewModel.fetchArtwork()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
