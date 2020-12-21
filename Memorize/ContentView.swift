//
//  ContentView.swift
//  Memorize
//
//  Created by eksinyue on 21/12/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack() {
            ForEach(0..<4) { index in
                HStack() {
                    ForEach(0..<3) { index in
                        CardView(isFaceUp: true)
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
    var isFaceUp: Bool
    var body: some View {
        ZStack() {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text("🎄")
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
