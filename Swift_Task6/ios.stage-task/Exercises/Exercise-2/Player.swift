//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        hasSomeCardWithSameValue(as: card)
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        let cardsOnTheTable = Array<Card>(table.keys) + Array<Card>(table.values)
        return cardsOnTheTable.contains { hasSomeCardWithSameValue(as: $0) }
    }
    
    private func hasSomeCardWithSameValue(as card: Card) -> Bool {
        hand!.contains { $0.value == card.value }
    }
}
