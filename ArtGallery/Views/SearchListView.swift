//
//  SearchListView.swift
//  ArtGallery
//
//  Created by Makena Robison on 3/14/22.
//

import SwiftUI

struct SearchListView: View {
    var searchTerm: String
    
    @State var loading = false
    @State var errorOccurred = false
    @State var results: [ArtworkSearched] = []
    
    var body: some View {
        VStack{
            if loading {
               ProgressView()
           } else if errorOccurred {
                Text("Sorry, something went wrong.")
           } else {
                VStack{
                    Text("Hello")
                    Text("\(results[0].title)")
                    List(results, id: \.self) { artwork in
                        ArtResultRow(result: artwork)
                    }.refreshable {
                        await loadSearchResults()
                    }
    //                ArtResultRow(result: ArtworkSearched(id: 16571, title: "Arrival of the Normandy Train, Gare Saint-Lazare", api_link: "https://api.artic.edu/api/v1/artworks/16571"))
                }
           }
        }
        .task(id: searchTerm){
            await loadSearchResults()
        }
                
            
//            NavigationView{
//                Text("Hello")
//                //ArtResultRow(result: results[0])
//                ForEach(results, id: \.self){ artwork in
//                    List {
//                        NavigationLink{
//                            ArtDetailView(art: artwork)
//                        }label: {
//                            ArtResultRow(result: artwork)
//                        }
//                    }
//                    .navigationTitle("results")
//                    .refreshable {
//                        await loadSearchResults()
//                    }
        
                

    
    }
    
    func loadSearchResults() async {
        errorOccurred = false
        loading = true
        
        do {
            let searchPage = try await searchARTIC(term: searchTerm)
            results = searchPage.data
        } catch {
            errorOccurred = true
            
            // Only a dev will be able to see this, of course.
            debugPrint("Unexpected error: \(error)")
        }
        
        loading = false
    }
}




struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView(searchTerm: "monet")
    }
}
