//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by eksinyue on 21/12/20.
//
//  Model

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            TopBarView(viewModel: viewModel)
            Spacer()
            if viewModel.hasEnded {
                endGameView(score: viewModel.score)
            } else {
                Grid(viewModel.cards) { card in
                    CardView(card: card).onTapGesture {
                        viewModel.choose(card: card)
                    }
                    .padding(5)
                }
            }
        }
        .padding()
        .foregroundColor(viewModel.themeColor)
        .buttonStyle(OutlinedButton(color: viewModel.themeColor))

    }
}

struct TopBarView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            Text(viewModel.themeName)
                .font(.system(size: 23, weight: .bold, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            Button("New Game") {
                viewModel.startNewGame()
            }
            
            .padding(.trailing)
            .frame(maxWidth: .infinity, alignment: .trailing)
        }.frame(maxWidth: .infinity)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack() {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                } else if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
            .font(Font.system(size: fontSize(for: geometry.size)))
        }
    }
    
    // MARK: - Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}

struct endGameView: View {
    var score: Int
    
    var body: some View {
        VStack (spacing: 15) {
            Text("Congratulations!")
            Text("Your total score is")
            Text("\(score) points")
                .font(.system(size: 30, weight: .bold, design: .default))
        }
        .font(.system(size: 23, weight: .bold, design: .default))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
 
