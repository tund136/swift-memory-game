//
//  ContentView.swift
//  swift-memory-game
//
//  Created by Danh Tu on 13/09/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct CardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 3)
            Text("Hello World")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
