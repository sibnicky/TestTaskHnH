//
//  LogoGameView.swift
//  PlayerAndMonsters
//
//  Created by quest_01 on 08/10/2023.
//

import UIKit

class LogoGameView: UIView {

    private let playerLabel = UILabel()
    private let xLabel = UILabel()
    private let monstersLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false

        // Добавляем и настраиваем первый Label "PLAYER"
        playerLabel.translatesAutoresizingMaskIntoConstraints = false
        playerLabel.text = "PLAYER"
        playerLabel.textAlignment = .center
        addSubview(playerLabel)

        // Добавляем и настраиваем второй Label "X"
        xLabel.translatesAutoresizingMaskIntoConstraints = false
        xLabel.text = "X"
        xLabel.textAlignment = .center
        addSubview(xLabel)

        // Добавляем и настраиваем третий Label "MONSTERS"
        monstersLabel.translatesAutoresizingMaskIntoConstraints = false
        monstersLabel.text = "MONSTERS"
        monstersLabel.textAlignment = .center
        addSubview(monstersLabel)

        // Располагаем Labels вертикально внутри LogoGameView
        NSLayoutConstraint.activate([
            playerLabel.topAnchor.constraint(equalTo: topAnchor),
            playerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            playerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            playerLabel.heightAnchor.constraint(equalToConstant: 30),

            xLabel.topAnchor.constraint(equalTo: playerLabel.bottomAnchor, constant: 10), // Расстояние между "PLAYER" и "X"
            xLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            xLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            xLabel.heightAnchor.constraint(equalToConstant: 30),

            monstersLabel.topAnchor.constraint(equalTo: xLabel.bottomAnchor, constant: 10), // Расстояние между "X" и "MONSTERS"
            monstersLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            monstersLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            monstersLabel.heightAnchor.constraint(equalToConstant: 30),

        ])
    }
}
