//
//  ClassItem.swift
//  BearRate
//
//  Created by Jennessa Ma on 4/23/21.
//  mainly used in the ProfessorVC to represent a single class object with
//  several RatingInfo objects below it
//

import UIKit

class ClassItem: UIView {
    
    var className: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .darkGray
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 15, weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var data: [RatingInfo]?
    
    var dataStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    init(frame: CGRect = .zero, className: String, ratingInfo: [RatingInfo]) {
        super.init(frame: frame)
        data = ratingInfo
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
        guard let data = data else { return }
        addSubview(className)
        addSubview(dataStack)
        for rating in data {
            dataStack.addArrangedSubview(rating)
        }
        
        NSLayoutConstraint.activate([
            className.leadingAnchor.constraint(equalTo: leadingAnchor),
            className.topAnchor.constraint(equalTo: topAnchor),
            className.trailingAnchor.constraint(equalTo: trailingAnchor),
            dataStack.topAnchor.constraint(equalTo: className.bottomAnchor, constant: 5),
            dataStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            dataStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
