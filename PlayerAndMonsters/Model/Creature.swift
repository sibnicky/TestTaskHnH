//
//  Creature.swift
//  PlayerAndMonsters
//
//  Created by quest_01 on 04/10/2023.
//

import Foundation

class Creature {
    
    var name: String
    var attack: Int // от 1 до 30
    var defense: Int // от 1 до 30
    var health: Int // от 0 до N
    var damage: Int // M-N
    var isAlive: Bool = true
    
    init(name: String, attack: Int, defense: Int, health: Int, damage: Int) {
        self.name = name
        self.attack = attack
        self.defense = defense
        self.health = health
        self.damage = damage
    }
    
    func modifierAttack(opponentDefense: Int) -> Int {
        return attack - opponentDefense + 1
    }
    
    func rollDice() -> Bool {
        let diceRoll = Int.random(in: 1...6)
        return diceRoll == 5 || diceRoll == 6
    }
    
    func isSuccessAttack(attackModifier: Int) -> Bool {
        let numberOfDice = max(1, attackModifier)
        
        for _ in 0..<numberOfDice {
            if rollDice() {
                return true
            }
        }
        return false
    }
    
    func takeDamage(damage: Int) {
        health -= damage
        
        if health < 0 {
            health = 0
            isAlive = false
        }
    }

}
