//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by eksinyue on 21/12/20.
//
//  ModelView

import SwiftUI

class EmojiMemoryGame {
    
    //    private var model: MemoryGame<String> =
    //        MemoryGame<String>(numberOfPairsOfCards: 2,
    //                           cardContentFactory: { (pairIndex: Int) -> String in return "🥦" })
    
    //  type inference:
    //    private var model: MemoryGame<String> =
    //        MemoryGame<String>(numberOfPairsOfCards: 2,
    //                           cardContentFactory: { pairIndex in "🥦" })
    
    //    private var model: MemoryGame<String> =
    //        MemoryGame<String>(numberOfPairsOfCards: 2 ) { _ in "🥦" }
    
    
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    

    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🎄", "🥦", "🐢"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count ) { pairIndex in
            return emojis[pairIndex]
        }
    }

    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
