//
//  ProducerGallery.swift
//  Epah
//
//  Created by David Moreno on 5/10/22.
//

import SwiftUI

struct ProducerGallery: View {
    @EnvironmentObject private var model: Model
    
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(model.fetchedProducers) {producer in
                    NavigationLink {
                        ProducerDetail(producer: producer)
                    } label: {
                        ProducerCard(producer: producer)
                            .padding(.horizontal)
                    }
                }
            }
            .frame(maxWidth: .infinity)
           
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    ProducerEditView()
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                }
            }
        }
    }   
}

struct ProducerGallery_Previews: PreviewProvider {
    static var previews: some View {
        ProducerGallery()
            .environmentObject(Model())
    }
}
