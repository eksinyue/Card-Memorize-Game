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
        
        var themes: [MemoryGame<String>.Theme] = []
        
        themes.append(MemoryGame<String>.Theme(name: "Greenie Green",
                            color: Color.green, cards: ["🎄", "🥦", "🐢", "🧩", "🧤", "🪴", "🦖", "☘️", "🌳", "🦚", "🦠", "🥬", "🚛", "🔫", "🥑"]))
        themes.append(MemoryGame<String>.Theme(name: "Mood",
                            color: Color.yellow, cards: ["🤣", "☺️", "🤪", "🥸", "🤩", "🥳", "😭", "😤", "🥺", "🤯", "🤥", "🙄", "😴", "🤮", "🤧"]))
        themes.append(MemoryGame<String>.Theme(name: "Zoo",
                            color: Color.orange, cards: ["🐶", "🐨", "🐷", "🐒", "🐥", "🐝", "🦕", "🦭", "🦧", "🐘", "🐩", "🦔", "🦥", "🐳", "🐰"]))
        themes.append(MemoryGame<String>.Theme(name: "Transportation",
                            color: Color.blue, cards: ["✈️", "🛩", "🚀", "🛳", "⛴", "🚊", "🚔", "🛻", "🚎", "🚙", "🚐", "🚆", "🚲", "🛴", "🦽"]))
        themes.append(MemoryGame<String>.Theme(name: "Flags", numberOfPairsOfCards: 4,
                            color: Color.red, cards: ["🇯🇵", "🇭🇰", "🇬🇪", "🇫🇷", "🇨🇳", "🇨🇦", "🇵🇪", "🇧🇪", "🇳🇴", "🇲🇾", "🇸🇬", "🇰🇷", "🇹🇼", "🇹🇷", "🇺🇸"]))
        themes.append(MemoryGame<String>.Theme(name: "Numbers", numberOfPairsOfCards: 6,
                            color: Color.gray, cards: ["0️⃣", "1️⃣", "2️⃣", "3️⃣", "4️⃣", "5️⃣", "6️⃣", "7️⃣", "8️⃣", "9️⃣", "🔟", "#️⃣", "*️⃣", "⏺", "🔼"]))
        
        let theme = themes[Int.random(in: 0..<themes.count)]
        let emojis = theme.contentArr.shuffled()
        let numberOfPairsOfCards = theme.numberOfPairsOfCards ?? Int.random(in: 2...6)
        
        return MemoryGame<String>(theme: theme, numberOfPairsOfCards: numberOfPairsOfCards ) { pairIndex in
            return emojis[pairIndex]
        }
    }

    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var themeColor: Color {
        model.theme.color
    }
    
    var themeName: String {
        model.theme.name
    }
    
    var score: Int {
        model.score
    }
    
    var hasEnded: Bool {
        model.hasEnded
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        // ObjectWillChange.send()
        model.choose(card: card)
    }
    
    func startNewGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
