//
//  ContentView.swift
//  Memorize
//
//  Created by eksinyue on 21/12/20.
//
//  Model

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack() {
            ForEach(0..<4) { index in
                HStack() {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card).onTapGesture {
                            viewModel.choose(card: card)
                        }
                    }
                }
            }
        }
            .padding()
            .foregroundColor(Color.green)
            .font(Font.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack() {
            if !card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
 
