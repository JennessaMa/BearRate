//
//  ClassListVC.swift
//  BearRate
//
//  Created by Jennessa Ma on 4/19/21.
//

import Foundation
import UIKit

class ClassListVC: UIViewController {
    
    var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Classes"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.textAlignment = .center
        label.textColor = UIColor(red: 47/255, green: 77/255, blue: 184/255, alpha: 1) //navy blue
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var classes:[Class]? {
        didSet {
            guard let classes = classes else { return }
            var items: [ClassListItem] = []
            for c in classes {
                items.append(ClassListItem(name: c.name!, rating: c.overallRating!))
            }
            classItems = items
        }
    }
    
    var classItems: [ClassListItem]?
    
    var classStack: UIStackView = {
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
        for item in classItems! {
            classStack.addArrangedSubview(item)
        }
        view.addSubview(classStack)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            classStack.topAnchor.constraint(lessThanOrEqualTo: titleLabel.bottomAnchor, constant: 15),
            classStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            classStack.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}
