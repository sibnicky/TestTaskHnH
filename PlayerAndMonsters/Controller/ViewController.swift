//
//  ViewController.swift
//  PlayerAndMonsters
//
//  Created by quest_01 on 04/10/2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    private let logoGameView = LogoGameView()
    private let startButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(logoGameView)
        NSLayoutConstraint.activate([
            logoGameView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoGameView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            logoGameView.widthAnchor.constraint(equalToConstant: 200),
            logoGameView.heightAnchor.constraint(equalToConstant: 110)

        ])
        
        startButton.backgroundColor = .black
        startButton.setTitle("НАЧАТЬ ИГРУ", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        view.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.topAnchor.constraint(equalTo: logoGameView.bottomAnchor, constant: 20),
            startButton.widthAnchor.constraint(equalToConstant: 200),
            startButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        startButton.layer.cornerRadius = startButton.bounds.height / 2
        startButton.clipsToBounds = true
        
        startButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)

    }

    @objc func startGame() {
        print("p")
        let gameViewController = GameViewController()
        navigationController?.pushViewController(gameViewController, animated: true)
    }
}

