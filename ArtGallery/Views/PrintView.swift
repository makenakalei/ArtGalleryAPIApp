//
//  PrintView.swift
//  ArtGallery
//
//  Created by Makena Robison on 3/9/22.
//

import SwiftUI

struct PrintView: View {
    var imageUrl: URL

    var body: some View {
        AsyncImage(url: imageUrl) { image in
                image
                .resizable()
                .scaledToFit()
                .border(Color.black, width: 5)
        } placeholder: {
            ProgressView()
        }
        
        }
    }


struct PrintView_Previews: PreviewProvider {
    static var previews: some View {
        PrintView(imageUrl: URL(string: "https://www.artic.edu/iiif/2/1adf2696-8489-499b-cad2-821d7fde4b33/full/200,/0/default.jpg")!)
    }
}
