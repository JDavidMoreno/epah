//
//  ProducerMenu.swift
//  Epah
//
//  Created by David Moreno on 7/10/22.
//

import SwiftUI

struct ProducerMenu: View {
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            ProducerGallery()
                .navigationTitle(Text("Producers"))
        }
     
    }
}
