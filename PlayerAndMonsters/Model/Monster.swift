//
//  Monster.swift
//  PlayerAndMonsters
//
//  Created by quest_01 on 04/10/2023.
//

import Foundation

class Monster: Creature {
    
    static let possibleNames = ["Goblin", "Orc", "Troll", "Dragon", "Skeleton", "Zombie"]
    
    override init(name: String, attack: Int, defense: Int, health: Int, damage: Int) {
        super.init(name: name, attack: attack, defense: defense, health: health, damage: damage)
    }
    
    static func randomMonster() -> Monster {
        let randomNameIndex = Int.random(in: 0..<possibleNames.count)
        let randomName = possibleNames[randomNameIndex]
            
        let randomAttack = Int.random(in: 1...30)
        let randomDefense = Int.random(in: 1...30)
        let randomHealth = Int.random(in: 0...100)
        let randomDamage = Int.random(in: 0...100)
            
        return Monster(name: randomName, attack: randomAttack, defense: randomDefense, health: randomHealth, damage: randomDamage)
    }
}
