//
//  ProducerEditView.swift
//  Epah
//
//  Created by David Moreno on 5/10/22.
//
import AVFoundation
import SwiftUI
import PhotosUI

struct ProducerEditView: View {
    
    @State var image: Image?
    @State var name = ""
    @State var email = ""
    @State var phone = ""
    @State var address = ""
    @State var about = ""
    
    @EnvironmentObject private var model: Model
    @StateObject var imagePicker = ImagePicker()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
        
            Form {
                Section {
                    HStack {
                        Spacer()
                        ProfileImage(image: imagePicker.image)
                            .frame(width: 80, height: 80)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 3)
                            .overlay(alignment: .bottomTrailing) {
                                PhotosPicker(selection: $imagePicker.imageSelection,
                                             matching: .images,
                                             photoLibrary: .shared()) {
                                    Image(systemName: "pencil.circle.fill")
                                        .symbolRenderingMode(.multicolor)
                                        .font(.system(size: 30))
                                }
                                .buttonStyle(.borderless)
                            }
                        Spacer()
                    }
                }
               
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

struct ProfileImage: View {
    let image: Image?
    
    var body: some View {
        
        if let image = image {
            image
                .resizable()
        } else {
            Image(systemName: "photo")
                .font(.system(size: 50))
                
        }
    }
}

struct ProducerEditView_Previews: PreviewProvider {
    static var previews: some View {
        ProducerEditView()
            .environmentObject(Model())
    }
}
