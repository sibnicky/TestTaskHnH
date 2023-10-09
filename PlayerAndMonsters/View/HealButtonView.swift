//
//  HealButtonView.swift
//  PlayerAndMonsters
//
//  Created by quest_01 on 09/10/2023.
//

import UIKit

class HealButtonView: UIView {
    
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
            
        let healImageView = UIImageView(image: UIImage(systemName: "heart.circle.fill"))
        healImageView.tintColor = .green
        healImageView.translatesAutoresizingMaskIntoConstraints = false
            
        let healLabel = UILabel()
        healLabel.text = "Лечение"
        healLabel.textColor = .green
        healLabel.translatesAutoresizingMaskIntoConstraints = false
            
        addSubview(healImageView)
        addSubview(healLabel)
            
        NSLayoutConstraint.activate([
            healImageView.topAnchor.constraint(equalTo: topAnchor),
            healImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
                
            healLabel.topAnchor.constraint(equalTo: healImageView.bottomAnchor, constant: 5),
            healLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }

}
