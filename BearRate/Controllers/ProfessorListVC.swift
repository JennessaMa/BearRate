//
//  ProfessorListVC.swift
//  BearRate
//
//  Created by Jennessa Ma on 4/19/21.
//

import UIKit

class ProfessorListVC: UIViewController {
    
    var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Professors"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.textAlignment = .center
        label.textColor = UIColor(red: 47/255, green: 77/255, blue: 184/255, alpha: 1) //navy blue
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var professors: [Professor]? {
        didSet {
            guard let professors = professors else { return }
            var items: [ProfessorListItem] = []
            for prof in professors {
                items.append(ProfessorListItem(profImage: prof.image!, name: prof.name!, rating: prof.overallRating!))
            }
            professorItems = items
        }
    }
    
    var professorItems: [ProfessorListItem]?
    
    var profStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titleLabel)
//        for item in professorItems! {
//            profStack.addArrangedSubview(item)
//        }
//        view.addSubview(profStack)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
//            profStack.topAnchor.constraint(lessThanOrEqualTo: titleLabel.bottomAnchor, constant: 15),
//            profStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            profStack.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}
