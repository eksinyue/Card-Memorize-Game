//
//  MemorizeApp.swift
//  Memorize
//
//  Created by eksinyue on 21/12/20.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            ContentView(viewModel: game)
        }
    }
}
