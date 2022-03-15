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
    @State var results: [Artwork] = []
    
    var body: some View {
        
        if loading {
           ProgressView()
       }
        else if errorOccurred {
            Text("Sorry, something went wrong.")
        } else {
            VStack{
                Text("Hello")
                ArtResultRow(result: Artwork(id: 16571, title: "Arrival of the Normandy Train, Gare Saint-Lazare", api_link: "https://api.artic.edu/api/v1/artworks/16571", api_model: "artworks",  date_display:  "1877", artist_title: "Claude Monet", image_id: "0f1cc0e0-e42e-be16-3f71-2022da38cb93"))
            }
//            ForEach(results, id: \.self){artwork in
//                Text("\(artwork.title)")
//            }
                
//            ForEach(results, id: \.self) { artwork in
//                List {
//                    ArtResultRow(result: artwork)
//                }
//            }
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
        
//            .task(id: searchTerm) {
//                await loadSearchResults()
//            }
        }
    
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
