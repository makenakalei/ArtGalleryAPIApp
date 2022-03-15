//
//  HomeView.swift
//  ArtGallery
//
//  Created by Makena Robison on 3/10/22.
//

import SwiftUI

struct HomeView: View {
    @State private var searchTerm: String = ""
    
    var body: some View {
        VStack(alignment: .leading){
            PrintView(imageUrl: URL(string: "https://www.artic.edu/iiif/2/1adf2696-8489-499b-cad2-821d7fde4b33/full/200,/0/default.jpg")!)
            VStack(alignment: .leading){
                Text("ART GALLERY")
                    .foregroundColor(Color.white)
                Text("The Art Institue of Chicago")
            }.padding(.top, -30.0).padding(.leading, 6.0)
            TextField("Search", text: $searchTerm)
                .submitLabel(.search)
                .onSubmit{
                    SearchListView(searchTerm: searchTerm)
                }
            
            
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
