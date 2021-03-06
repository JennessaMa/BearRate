//
//  ProfessorListItem.swift
//  BearRate
//
//  Created by Jennessa Ma on 4/24/21.
//

import UIKit

class ProfessorListItem: UIView {
    
    var image: UIImageView?
    
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
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    init(frame: CGRect = .zero, profImage: UIImage, name: String, rating: Float) {
        super.init(frame: frame)
        image = UIImageView(image: profImage)
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
        //TODO: add image as a small circle to the stack
        infoStack.addArrangedSubview(nameLabel)
        infoStack.addArrangedSubview(ratingLabel)
        addSubview(infoStack)
        NSLayoutConstraint.activate([
            infoStack.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            infoStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5)
        ])
    }

}
