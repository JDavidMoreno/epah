//
//  ContentView.swift
//  Epah
//
//  Created by David Moreno on 5/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.green)
            TabView {
                NavigationView {
                    ProducerMenu()
                }
                .tabItem {
                    Label {
                        Text("Producers")
                    } icon: {
                        Image(systemName: "person.2.crop.square.stack")
                    }
                }
                NavigationView {
                    OrderList()
                }
                .tabItem {
                    Image(systemName: "bag")
                }
            }
            
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Model())
    }
}
