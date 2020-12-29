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
                            color: Color.green, contentArr: ["🎄", "🥦", "🐢", "🧩", "🧤", "🪴", "🦖", "☘️", "🌳", "🦚", "🦠", "🥬", "🚛", "🔫", "🥑"]))
        themes.append(MemoryGame<String>.Theme(name: "Mood",
                            color: Color.yellow, contentArr: ["🤣", "☺️", "🤪", "🥸", "🤩", "🥳", "😭", "😤", "🥺", "🤯", "🤥", "🙄", "😴", "🤮", "🤧"]))
        themes.append(MemoryGame<String>.Theme(name: "Zoo",
                            color: Color.orange, contentArr: ["🐶", "🐨", "🐷", "🐒", "🐥", "🐝", "🦕", "🦭", "🦧", "🐘", "🐩", "🦔", "🦥", "🐳", "🐰"]))
        themes.append(MemoryGame<String>.Theme(name: "Transportation",
                            color: Color.blue, contentArr: ["✈️", "🛩", "🚀", "🛳", "⛴", "🚊", "🚔", "🛻", "🚎", "🚙", "🚐", "🚆", "🚲", "🛴", "🦽"]))
        themes.append(MemoryGame<String>.Theme(name: "Flags",
                            color: Color.red, contentArr: ["🇯🇵", "🇭🇰", "🇬🇪", "🇫🇷", "🇨🇳", "🇨🇦", "🇵🇪", "🇧🇪", "🇳🇴", "🇲🇾", "🇸🇬", "🇰🇷", "🇹🇼", "🇹🇷", "🇺🇸"]))
        themes.append(MemoryGame<String>.Theme(name: "Numbers",
                            color: Color.gray, contentArr: ["0️⃣", "1️⃣", "2️⃣", "3️⃣", "4️⃣", "5️⃣", "6️⃣", "7️⃣", "8️⃣", "9️⃣", "🔟", "#️⃣", "*️⃣", "⏺", "🔼"]))
        
        let themeIndex = Int.random(in: 0..<themes.count)
        let emojis = themes[themeIndex].contentArr.shuffled()
        let numberOfPairsOfCards = Int.random(in: 2...6)
        
        return MemoryGame<String>(theme: themes[themeIndex], numberOfPairsOfCards: numberOfPairsOfCards ) { pairIndex in
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
