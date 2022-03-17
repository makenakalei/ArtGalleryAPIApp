//
//  ArtResultRow.swift
//  ArtGallery
//
//  Created by Makena Robison on 3/14/22.
//

import SwiftUI

struct ArtResultRow: View {
    var result: ArtworkSearched
   
    var body: some View {
        HStack(){
            Text(result.title)
                .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
        }
        .padding(.leading)
    }
   
}

struct ArtResultRow_Previews: PreviewProvider {
    static var previews: some View {
        ArtResultRow(result: ArtworkSearched(id: 16571, title: "Arrival of the Normandy Train, Gare Saint-Lazare", api_link: "https://api.artic.edu/api/v1/artworks/16571"))
    }
}
