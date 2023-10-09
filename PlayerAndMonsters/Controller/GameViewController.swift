//
//  GameViewController.swift
//  PlayerAndMonsters
//
//  Created by quest_01 on 07/10/2023.
//

import UIKit

class GameViewController: UIViewController {
   
//    var player = Player(name: "Nikita", attack: 15, defense: 5, health: 100, damage: 13)
    
    var player = Player.randomPlayer()
    var monsters: [Monster] = []
    var currentMonsterIndex = 0
    
    // MARK: - Private properties
    
    private let attackButtonView = AttackButtonView()
    private let healButtonView = HealButtonView()
    private let damageLabel = UILabel()
    
    private var playerInfoView: InfoCreatureView!
    private var monsterInfoView: InfoCreatureView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        generateMonsters()
        updateHealthLabels()
    }
     
    
    // MARK: - Private methods
    
    private func configure() {
        view.backgroundColor = .white

        configureInfoView()
        
        addSubview()
        
        layoutConstarint()
        
        let attackTapGesture = UITapGestureRecognizer(target: self, action: #selector(attack))
        attackButtonView.addGestureRecognizer(attackTapGesture)
        
        let healTapGesture = UITapGestureRecognizer(target: self, action: #selector(heal))
        healButtonView.addGestureRecognizer(healTapGesture)
        
        damageLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(damageLabel)
        NSLayoutConstraint.activate([
            damageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            damageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
    }
    
    private func configureInfoView() {
        playerInfoView = InfoCreatureView(name: player.name, health: player.health, isPlayer: true, countHealPoint: 4)
        monsterInfoView = InfoCreatureView(name: "", health: 0, isPlayer: false, countHealPoint: 0)
        
        playerInfoView.translatesAutoresizingMaskIntoConstraints = false
        monsterInfoView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func addSubview() {
        view.addSubview(playerInfoView)
        view.addSubview(monsterInfoView)
        view.addSubview(attackButtonView)
        view.addSubview(healButtonView)
    }
    
    @objc func attack() {
        attackPlayerOnMonster()
        attackMonsterOnPlayer()
        updateHealthLabels()
        isDeadPlayer()
        isDeadMonster()
    }
    
    @objc func heal() {
        if player.heal() {
            let alertController = UIAlertController(title: "Следующий монстр", message: "Здоровье исцелено на 30 процентов", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ок", style: .default) { _ in
            }
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "Следующий монстр", message: "Не получилось исцелиться", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ок", style: .default) { _ in
            }
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
        attackMonsterOnPlayer()
        updateHealthLabels()
    }
    
    func attackPlayerOnMonster() {
        let playerAttackModifier = player.modifierAttack(opponentDefense: monsters[currentMonsterIndex].defense)
        if player.isSuccessAttack(attackModifier: playerAttackModifier) {
            let damage = player.damage
            monsters[currentMonsterIndex].takeDamage(damage: damage)
            damageLabel.text = "\(player.name) нанес \(monsters[currentMonsterIndex].name) \(damage) урона"
        } else {
            damageLabel.text = "\(player.name) не смог нанести урон \(monsters[currentMonsterIndex].name)"
        }
    }
    
    func attackMonsterOnPlayer() {
        let monsterAttackModifier = monsters[currentMonsterIndex].modifierAttack(opponentDefense: player.defense)
        if monsters[currentMonsterIndex].isSuccessAttack(attackModifier: monsterAttackModifier) {
            let damage = monsters[currentMonsterIndex].damage
            player.takeDamage(damage: damage)
            damageLabel.text = "\(monsters[currentMonsterIndex].name) нанес \(player.name) \(damage) урона"
//            print("\(monsters[currentMonsterIndex].name) нанес \(player.name) \(damage) урона")
        } else {
            damageLabel.text = "\(monsters[currentMonsterIndex].name) не смог нанести урон \(player.name)"
//            print("\(monsters[currentMonsterIndex].name) не смог нанести урон \(player.name)")
        }
    }
    
    func isDeadPlayer() {
        if !player.isAlive {
            showGameOverMessage(message: "Game Over! You lose!")
        }
    }

    func isDeadMonster() {
        if !monsters[currentMonsterIndex].isAlive {
            showContinueGameMessage()
        }
    }
    
    func updateHealthLabels() {
        playerInfoView.updateInfo(name: player.name, health: player.health, isPlayer: true, countHealPoint: player.maxCountHeal)
        if currentMonsterIndex < monsters.count {
            let monster = monsters[currentMonsterIndex]
            monsterInfoView.updateInfo(name: monster.name, health: monster.health, isPlayer: false, countHealPoint: 0)
        }
    }
    
    func showContinueGameMessage() {
        let alertController = UIAlertController(title: "Следующий монстр", message: "Продолжить игру?", preferredStyle: .alert)
        let nextAction = UIAlertAction(title: "Продолжить", style: .default) { [weak self] _ in
            self?.nextMonster()
        }
        
        let exitAction = UIAlertAction(title: "Выйти", style: .default) { [weak self] _ in
            let viewController = ViewController()
            self?.navigationController?.pushViewController(viewController, animated: true)
        }
        alertController.addAction(nextAction)
        alertController.addAction(exitAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func showGameOverMessage(message: String) {
        let alertController = UIAlertController(title: "Game Over", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            let viewController = ViewController()
            self?.navigationController?.pushViewController(viewController, animated: true)
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func nextMonster() {
        if currentMonsterIndex < monsters.count - 1 {
            currentMonsterIndex += 1
            updateHealthLabels()
        } else {
            showGameOverMessage(message: "Game Over! You win!")
        }
    }
    
    func generatePlayer() {
        
    }
    
    func generateMonsters() {
        let numberOfMonsters = Int.random(in: 1...5)
        for _ in 0..<numberOfMonsters {
            monsters.append(Monster.randomMonster())
        }
    }
    
    
    //MARK: - Constraints
    
    private func layoutConstarint() {
        NSLayoutConstraint.activate([
            monsterInfoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            monsterInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            monsterInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            monsterInfoView.heightAnchor.constraint(equalToConstant: 100),
                    
            playerInfoView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            playerInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            playerInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -160),
            playerInfoView.heightAnchor.constraint(equalToConstant: 100),
                
            attackButtonView.centerYAnchor.constraint(equalTo: playerInfoView.centerYAnchor),
            attackButtonView.leadingAnchor.constraint(equalTo: playerInfoView.trailingAnchor, constant: 20),
            attackButtonView.widthAnchor.constraint(equalToConstant: 40),
            attackButtonView.heightAnchor.constraint(equalToConstant: 40),
                
            healButtonView.centerYAnchor.constraint(equalTo: playerInfoView.centerYAnchor),
            healButtonView.leadingAnchor.constraint(equalTo: attackButtonView.trailingAnchor, constant: 20),
            healButtonView.widthAnchor.constraint(equalToConstant: 40),
            healButtonView.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
}
