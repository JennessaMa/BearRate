//
//  ClassListItem.swift
//  BearRate
//
//  Created by Jennessa Ma on 4/24/21.
//

import UIKit

class ClassListItem: UIView {

    var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .darkGray
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 15, weight: .medium)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var ratingLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .darkGray
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 15, weight: .medium)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var infoStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    init(frame: CGRect = .zero, name: String, rating: Float) {
        super.init(frame: frame)
        nameLabel.text = name
        ratingLabel.text = String(rating)
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        infoStack.addArrangedSubview(nameLabel)
        infoStack.addArrangedSubview(ratingLabel)
        addSubview(infoStack)
        NSLayoutConstraint.activate([
            infoStack.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            infoStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5)
        ])
    }

}
