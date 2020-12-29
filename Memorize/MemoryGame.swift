//
//  MemoryGame.swift
//  Memorize
//
//  Created by eksinyue on 21/12/20.
//
//  Model

import SwiftUI

struct MemoryGame<CardContent> where CardContent: Equatable{

    var theme: Theme
    var cards: Array<Card>
    var score: Int = 0
    
    var oneAndOnlyChosenCardIndex: Int? {
        get { cards.indices.filter {index in cards[index].isFaceUp}.only }
        
        set {
            for index in cards.indices { cards[index].isFaceUp = index == newValue }
        }
    }
    
    var hasEnded: Bool {
        cards.indices.filter {index in !cards[index].isMatched}.isEmpty
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched  {
            if let faceUpCardIndex = oneAndOnlyChosenCardIndex {
                if cards[faceUpCardIndex].content == cards[chosenIndex].content {
                    cards[faceUpCardIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                oneAndOnlyChosenCardIndex = chosenIndex
            }
        }
    }
    
    init(theme: Theme, numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        self.theme = theme
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
        cards = cards.shuffled()
    }
    
    
    struct Theme {
        var name: String
        var color: Color
        var contentArr: [CardContent]
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
