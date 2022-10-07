//
//  ProducerEditView.swift
//  Epah
//
//  Created by David Moreno on 5/10/22.
//

import SwiftUI

struct ProducerEditView: View {
    @State var name = ""
    @State var email = ""
    @State var phone = ""
    @State var address = ""
    @State var about = ""
    
    @EnvironmentObject private var model: Model
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            Form {
                Section(header: Text("Basic Information")) {
                    TextField("Producer name", text: $name)
                    TextField("Email", text: $email)
                    TextField("Phone", text: $phone)
                    TextField("Something about you...", text: $about, axis: .vertical)
                }
                Section(header: Text("Where to find")) {
                    TextField("Address", text: $address)
                }
                Button("Save", action: {
                    model.fetchedProducers.append(Producer(
                        id: Int.random(in: 1...1000),
                        name: name,
                        address: address
                    ))
                    dismiss()
                })
            }
            .scrollContentBackground(.hidden)
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct ProducerEditView_Previews: PreviewProvider {
    static var previews: some View {
        ProducerEditView()
            .environmentObject(Model())
    }
}
