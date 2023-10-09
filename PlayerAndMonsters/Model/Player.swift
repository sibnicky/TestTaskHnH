//
//  Player.swift
//  PlayerAndMonsters
//
//  Created by quest_01 on 04/10/2023.
//

import Foundation

class Player: Creature {

    static let possibleNames = ["Nikita", "Jhon", "Andrew", "Elon", "Roman", "Ivan"]
    
    var maxCountHeal: Int = 4
    
    func heal() -> Bool {
        if isAlive && maxCountHeal > 0 {
            let healAmount = Int(Double(health) * 0.3)
            health += healAmount
            if health > 100 {
                health = 100
            }
            
            maxCountHeal -= 1
            return true
        }
        
        return false
    }
    
    static func randomPlayer() -> Player {
        let randomNameIndex = Int.random(in: 0..<possibleNames.count)
        let randomName = possibleNames[randomNameIndex]
            
        let randomAttack = Int.random(in: 1...30)
        let randomDefense = Int.random(in: 1...30)
        let randomHealth = Int.random(in: 0...100)
        let randomDamage = Int.random(in: 0...100)
            
        return Player(name: randomName, attack: randomAttack, defense: randomDefense, health: randomHealth, damage: randomDamage)
    }
    
}

