//
//  ClassProfessorItem.swift
//  BearRate
//
//  Created by Jennessa Ma on 4/25/21.
//  used in creating a part of the ClassVC stack which includes several ClassProfessorItems
//

import UIKit

class ClassProfessorItem: UIView {

    var classProfObject: ClassProfessorObject?
    
    var image: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .darkGray
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 15, weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var review1Text: UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.numberOfLines = 4
        lbl.textColor = .gray
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 10, weight: .regular)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var review2Text: UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.numberOfLines = 4
        lbl.textColor = .gray
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 10, weight: .regular)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
//    --------------------------
//    |                        |
//    |  [iv]  nameLabel       |
//    |                        |
//    |  [review1 text .....]  |
//    |                        |
//    |  ------divider-------  |
//    |                        |
//    |  [review2 text ......] |
//    |                        |
//    --------------------------
    
    init(frame: CGRect = .zero, classProf: ClassProfessorObject) {
        super.init(frame: frame)
        image.image = classProf.professor?.image
        nameLabel.text = classProf.professor?.name
        for i in 0..<max(2, classProf.reviews.count) {
            if i == 0 {
                review1Text.text = classProf.reviews[i].description
            } else {
                review2Text.text = classProf.reviews[i].description
            }
        }
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
        //TODO: make image a small circle to the left of nameLabel
        addSubview(image)
        addSubview(nameLabel)
        addSubview(review1Text)
        //TODO: add a horizontal divider between these reviews
        addSubview(review2Text)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            review1Text.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            review1Text.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            review1Text.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            review2Text.topAnchor.constraint(equalTo: review1Text.bottomAnchor, constant: 10),
            review2Text.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            review2Text.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }

}
