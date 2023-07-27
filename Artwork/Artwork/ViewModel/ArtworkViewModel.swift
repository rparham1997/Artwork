//
//  ArtworkViewModel.swift
//  Artwork
//
//  Created by Ramar Parham on 7/27/23.
//

import Foundation
import Combine

class ArtworkViewModel: ObservableObject {
    @Published private(set) var artworks = [Artwork]()
    private var cancellables = Set<AnyCancellable>()
    private let jsonDecoder = JSONDecoder()
    
    func fetchArtwork() {
        guard let url = URL(string: "https://api.artic.edu/api/v1/artworks") else { return }
        
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: ArtworkDataResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    print("It finished!")
                }
            } receiveValue: { [weak self] response in
                self?.artworks = response.data
            }
            .store(in: &cancellables)
    }
}
