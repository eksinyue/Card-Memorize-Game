//
//  MemoryGame.swift
//  Memorize
//
//  Created by eksinyue on 21/12/20.
//
//  Model

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{

    var cards: Array<Card>
    
    var oneAndOnlyChosenCardIndex: Int? {
        
        get { cards.indices.filter {index in cards[index].isFaceUp}.only }
        
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
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
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
        cards = cards.shuffled()
    }
    
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
