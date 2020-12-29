//
//  Array+Only.swift
//  Memorize
//
//  Created by eksinyue on 29/12/20.
//

import Foundation

extension Array {
    var only: Element? {
        self.count == 1 ? self.first : nil
    }
}
