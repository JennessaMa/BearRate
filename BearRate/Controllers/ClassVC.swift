//
//  ClassVC.swift
//  BearRate
//
//  Created by Jennessa Ma on 4/19/21.
//

import Foundation
import UIKit

class ClassVC: UIViewController {
    //a class can be taught by many professors
    //tapping one of the professors -> ClassProfessorVC
    
    var classVar: Class?
    
    var classProfs: [ClassProfessorObject]? {
        didSet {
            guard let classProfs = classProfs else { return }
            for cp in classProfs {
                stackItems.append(ClassProfessorItem(classProf: cp))
            }
        }
    }
    
    var titleLabel: UILabel = { //i.e. AEROSPC1A
        let lbl = UILabel()
        lbl.textColor = UIColor(red: 47/255, green: 77/255, blue: 184/255, alpha: 1) //navy blue
        lbl.textAlignment = .center
        lbl.font = .boldSystemFont(ofSize: 30)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var nameLabel: UILabel = { //i.e. Foundations of the U.S. Air Force
        let lbl = UILabel()
        lbl.textColor = .darkGray
        lbl.textAlignment = .center
        lbl.font = .boldSystemFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var overallClassRating: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(red: 253/255, green: 181/255, blue: 21/255, alpha: 1) //orange
        lbl.textAlignment = .center
        lbl.font = .boldSystemFont(ofSize: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var stackItems: [ClassProfessorItem] = []
    
    var classProfStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        guard let classVar = classVar else { return }
        titleLabel.text = classVar.classTitle
        nameLabel.text = classVar.name
        overallClassRating.text = "Overall Class Rating: " + String(classVar.overallRating!)
        
        for item in stackItems {
            classProfStack.addArrangedSubview(item)
        }
        
        view.addSubview(titleLabel)
        view.addSubview(nameLabel)
        view.addSubview(overallClassRating)
        view.addSubview(classProfStack)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            overallClassRating.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            overallClassRating.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            overallClassRating.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            classProfStack.topAnchor.constraint(equalTo: overallClassRating.bottomAnchor, constant: 15),
            classProfStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            classProfStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
}
