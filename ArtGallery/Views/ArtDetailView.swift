//
//  ArtDetailView.swift
//  ArtGallery
//
//  Created by Makena Robison on 3/10/22.
//

import SwiftUI

struct ArtDetailView: View {
    var artSearch: ArtworkSearched
    @State var errorOccurred = false
    @State var loading = true
    @State var art: Artwork?
    
    var body: some View {
        VStack{
            if let loadedArt = art{
                VStack(alignment: .leading){
                    PrintView(imageUrl: loadedArt.getPrintLink(size: "200"))
                    VStack(alignment: .leading){
                        Text(loadedArt.title)
                            .font(.title)
                        Text(loadedArt.artist_title)
                        Text(loadedArt.date_display)
                    }.padding(.leading)
                }
            } else if loading {
                ProgressView()
            } else if errorOccurred {
                Text("Sorry, something went wrong.")
            } else {
                Text("this isn't running")
            }
        }.task {
            await loadArtwork()
        }
    }
    
    func loadArtwork() async{
        errorOccurred = false
        art = nil
        
        do {
            let response = try await getArtwork(id: artSearch.id)
            art = response
        } catch ArtICAPIError.unexpectedAPIError {
            errorOccurred = true
        } catch {

            debugPrint("Unexpected error: \(error)")
        }
        loading = false
    }
    
}

struct ArtDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArtDetailView(artSearch: ArtworkSearched(id: 16571, title: "Arrival of the Normandy Train, Gare Saint-Lazare", api_link: "https://api.artic.edu/api/v1/artworks/16571"))
    }
}
