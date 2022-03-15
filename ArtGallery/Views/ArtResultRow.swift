//
//  ArtResultRow.swift
//  ArtGallery
//
//  Created by Makena Robison on 3/14/22.
//

import SwiftUI

struct ArtResultRow: View {
    var result: Artwork
   
    var body: some View {
        HStack(){
            PrintView(imageUrl: result.getPrintLink(size: "200"))
            Spacer()
            Text(result.title)
                .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.trailing)
        }
    }
   
}

struct ArtResultRow_Previews: PreviewProvider {
    static var previews: some View {
        ArtResultRow(result: Artwork(id: 16571, title: "Arrival of the Normandy Train, Gare Saint-Lazare", api_link: "https://api.artic.edu/api/v1/artworks/16571", api_model: "artworks",  date_display:  "1877", artist_title: "Claude Monet", image_id: "0f1cc0e0-e42e-be16-3f71-2022da38cb93"))
    }
}
