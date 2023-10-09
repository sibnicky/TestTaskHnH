//
//  AttackButtonView.swift
//  PlayerAndMonsters
//
//  Created by quest_01 on 09/10/2023.
//

import UIKit

class AttackButtonView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        
        let attackImageView = UIImageView(image: UIImage(systemName: "bolt.fill"))
        attackImageView.tintColor = .red
        attackImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let attackLabel = UILabel()
        attackLabel.text = "Атака"
        attackLabel.textColor = .red
        attackLabel.translatesAutoresizingMaskIntoConstraints = false

        addSubview(attackImageView)
        addSubview(attackLabel)
                
        NSLayoutConstraint.activate([
            attackImageView.topAnchor.constraint(equalTo: topAnchor),
            attackImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
                    
            attackLabel.topAnchor.constraint(equalTo: attackImageView.bottomAnchor, constant: 5),
            attackLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}
