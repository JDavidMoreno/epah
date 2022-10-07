//
//  ProducerDetail.swift
//  Epah
//
//  Created by David Moreno on 5/10/22.
//

import SwiftUI

struct ProducerDetail: View {
    let producer: Producer
    
    var body: some View {
        ScrollView {
            
            Image("garden")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300)
                .clipped()
            
            VStack {
                Text(producer.name)
                Text(producer.address)
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

struct ProducerDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProducerDetail(producer: Producer.demoData)
    }
}
