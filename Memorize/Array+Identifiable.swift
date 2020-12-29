//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by eksinyue on 29/12/20.
//

import Foundation

extension Array where Element: Identifiable {
    
    func firstIndex(matching item: Element) -> Int? { // Optional<Int>
        for index in 0..<self.count {
            if self[index].id == item.id {
                return index
            }
        }
        return nil
    }
}
