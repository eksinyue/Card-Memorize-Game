//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by eksinyue on 21/12/20.
//
//  ModelView

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    //    private var model: MemoryGame<String> =
    //        MemoryGame<String>(numberOfPairsOfCards: 2,
    //                           cardContentFactory: { (pairIndex: Int) -> String in return "🥦" })
    
    //  type inference:
    //    private var model: MemoryGame<String> =
    //        MemoryGame<String>(numberOfPairsOfCards: 2,
    //                           cardContentFactory: { pairIndex in "🥦" })
    
    //    private var model: MemoryGame<String> =
    //        MemoryGame<String>(numberOfPairsOfCards: 2 ) { _ in "🥦" }
    
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    

    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🎄", "🥦", "🐢", "🧩", "🧤", "🪴", "🦖", "☘️", "🌳", "🦚", "🦠", "🥬", "🚛", "🔫", "🥑"].shuffled()
        let numberOfPairsOfCards = Int.random(in: 2...5)
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards ) { pairIndex in
            return emojis[pairIndex]
        }
    }

    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        // ObjectWillChange.send()
        model.choose(card: card)
    }
}
