//
//  ContentView.swift
//  swift-memory-game
//
//  Created by Danh Tu on 13/09/2021.
//

import SwiftUI

struct ContentView: View {
    private let emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚐", "🚜", "🛵", "🚔", "🚟","🦊", "🐻", "🐼", "🐹", "🦄", "🦋", "☘️", "🌹", "🌸", "🎾", "🥋", "🎣", "🪃", "🥌", "⛷", "🛼", "🥍", "🚴‍♀️", "🚣"]
    @State private var emojiCount = 20
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
    
    var remove: some View {
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        }, label: {
            Text("Remove Card")
        })
    }
    
    var add: some View {
        Button(action: {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        }, label: {
            Text("Add Card")
        })
    }
}

struct CardView: View {
    var content: String
    @State private var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 10)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        
        ContentView()
            .preferredColorScheme(.light)
    }
}
