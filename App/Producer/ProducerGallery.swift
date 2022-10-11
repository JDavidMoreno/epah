//
//  ProducerGallery.swift
//  Epah
//
//  Created by David Moreno on 5/10/22.
//

import SwiftUI

struct ProducerGallery: View {
    @State var isPresentingNewProducer = false
    @EnvironmentObject private var model: Model
    
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(model.producers) {producer in
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
                Button {
                    isPresentingNewProducer = true
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                }
            }
        }
        .sheet(isPresented: $isPresentingNewProducer) {
            NavigationView {
                ProducerEditView()
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingNewProducer = false
                            }
                        }
                    }
            }
        }
        .onAppear {
            model.load(Producer.self) { result in
                switch result {
                case .success(let producers):
                    model.producers = producers
                case .failure(let error):
                    fatalError(error.localizedDescription)
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
