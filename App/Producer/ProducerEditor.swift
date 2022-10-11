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
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var model: Model
    
    @State var newProducerData = Producer.Data()
    @StateObject var imagePicker = ImagePicker()
    
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
                    TextField("Producer name", text: $newProducerData.name)
                    TextField("Email", text: $newProducerData.email)
                    TextField("Phone", text: $newProducerData.phone)
                    TextField("Something about you...", text: $newProducerData.about, axis: .vertical)
                }
                Section(header: Text("Where to find")) {
                    TextField("Address", text: $newProducerData.address)
                }
                Button("Save", action: {
                    let producer = Producer(fromData: newProducerData)
                    model.save([producer]) { result in
                        switch result {
                        case .success(let count):
                            model.producers.append(producer)
                            print(count)
                        case .failure(let error):
                            print(error)
                        }
                    }
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
