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
                NavigationView{
                    List(results, id: \.self) { artwork in
                        NavigationLink(destination: ArtDetailView(artSearch: artwork)){
                            ArtResultRow(result: artwork)
                        }
                    }.refreshable {
                        await loadSearchResults()
                    }
                    .navigationBarTitle("Results")
                }
            }
        }.task(id: searchTerm){
            await loadSearchResults()
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
