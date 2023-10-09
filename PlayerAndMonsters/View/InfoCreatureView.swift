//
//  InfoCreatureView.swift
//  PlayerAndMonsters
//
//  Created by quest_01 on 07/10/2023.
//

import UIKit

class InfoCreatureView: UIView {
    
    private let stackView = UIStackView()
    private let iconCreatureLabel = UILabel()
    private let infoLabel = UILabel()
    
    init(name: String, health: Int, isPlayer: Bool, countHealPoint: Int){
        super.init(frame: .zero)
        configure()
        updateInfo(name: name, health: health, isPlayer: isPlayer, countHealPoint: countHealPoint)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        configureContainerView()
        configureStackView()
        configureIconCreatureLabel()
        configureInfoLabel()
        
        layoutConstraints()
    }
    
    private func configureContainerView() {
        backgroundColor = .gray
        layer.cornerRadius = 20
    }
    
    private func configureStackView() {
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
    }
    
    private func configureIconCreatureLabel() {
        iconCreatureLabel.textAlignment = .center
        iconCreatureLabel.font = UIFont.systemFont(ofSize: 30)
        stackView.addArrangedSubview(iconCreatureLabel)
    }
    
    private func configureInfoLabel() {
        infoLabel.textAlignment = .left
        infoLabel.numberOfLines = 0
        stackView.addArrangedSubview(infoLabel)
    }
    
    func updateInfo(name: String, health: Int, isPlayer: Bool, countHealPoint: Int) {
        if isPlayer {
            iconCreatureLabel.text = "🥷"
            infoLabel.text = """
                            Name: \(name)
                            Health: \(health)
                            Count heal: \(countHealPoint)
                            """
        } else {
            iconCreatureLabel.text = "🧟"
            infoLabel.text = """
                            Name: \(name)
                            Health: \(health)
                            """
        }
    }
    
    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
    }
}
