//
//  ArtDetailView.swift
//  ArtGallery
//
//  Created by Makena Robison on 3/10/22.
//

import SwiftUI

struct ArtDetailView: View {
    var art: Artwork
    @State var errorOccurred = false

    var body: some View {
            VStack(alignment: .leading){
                PrintView(imageUrl: art.getPrintLink(size: "200"))
                VStack(alignment: .leading){
                    Text(art.title)
                        .font(.title)
                    Text(art.artist_title)
                    Text(art.date_display)
                }.padding(.leading)
            
        }

        
    }
    
    
}

struct ArtDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArtDetailView(art: Artwork(id: 16571, title: "Arrival of the Normandy Train, Gare Saint-Lazare", api_link: "https://api.artic.edu/api/v1/artworks/16571", api_model: "artworks",  date_display:  "1877", artist_title: "Claude Monet", image_id: "0f1cc0e0-e42e-be16-3f71-2022da38cb93"))
    }
}
