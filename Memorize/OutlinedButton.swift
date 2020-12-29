//
//  OutlinedButton.swift
//  Memorize
//
//  Created by eksinyue on 30/12/20.
//

import SwiftUI

struct OutlinedButton: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .gray : color)
            .padding(9)
            .background(
                RoundedRectangle(
                    cornerRadius: 8,
                    style: .continuous
                ).stroke(color)
        )
    }
}
