//
//  HomeView.swift
//  ArtGallery
//
//  Created by Makena Robison on 3/10/22.
//

import SwiftUI

struct HomeView: View {
    @State private var searchTerm: String = ""
    @State private var activeSearch: String = ""
    
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                Text("ART GALLERY")
                    .foregroundColor(Color.black)
                Text("The Art Institue of Chicago")
                    .foregroundColor(Color.white)
            }.padding(.top, 10.0).padding(.leading, 10.0).padding(.trailing, 106.0)
                .background(Color.red)
            TextField("Search", text: $activeSearch)
                .submitLabel(.search)
                .onSubmit{
                    searchTerm = activeSearch.filter { !$0.isWhitespace }
                }
            SearchListView(searchTerm: searchTerm)
            
            
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
