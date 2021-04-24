//
//  RatingInfo.swift
//  BearRate
//
//  Created by Jennessa Ma on 4/23/21.
//

import UIKit

final class RatingInfo: UIView {

    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .darkGray
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 18, weight: .medium)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let valueLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(red: 253/255, green: 181/255, blue: 21/255, alpha: 1)
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 15, weight: .medium)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    init(frame: CGRect = .zero, title: String, value: Float) {
        super.init(frame: frame)
        titleLabel.text = title.uppercased()
        valueLabel.text = String(value)
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
        addSubview(titleLabel)
        addSubview(valueLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            valueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            valueLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
