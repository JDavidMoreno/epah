//
//  ProducerCard.swift
//  Epah
//
//  Created by David Moreno on 5/10/22.
//

import SwiftUI



struct ProducerCard: View {
    let producer: Producer
    
    var body: some View {
        HStack {
            Image(systemName: "house")
                .padding()
            VStack(alignment: .leading) {
                Text(producer.name)
                    .font(.headline)
                Text(producer.address)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }
            .padding()
            Spacer()
        }
        .background(Color(.white))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.2), radius: 3)
        .foregroundColor(.primary)
    }
}

struct ProducerCard_Previews: PreviewProvider {
    static var previews: some View {
        ProducerCard(producer: Producer.sampleData)
    }
}
