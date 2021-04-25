//
//  ClassProfessorVC.swift
//  BearRate
//
//  Created by Jennessa Ma on 4/23/21.
//  accessed by tapping on one of the ClassItem in ProfessorVC OR one of the ClassProfessorItem in ClassVC
//

import UIKit

class ClassProfessorVC: UIViewController {
    
    var classProfObject: ClassProfessorObject? {
        didSet {
            guard let classProfObject = classProfObject else { return }
            nameLabel.text = classProfObject.classVar?.name
            overallClassRating.text = "Overall Class Rating: " + String((classProfObject.classVar?.overallRating)!)
            image.image = classProfObject.professor?.image
            profName.text = classProfObject.professor?.name
            classProfOverallRating.text = String(classProfObject.getOverallRating())
            teachingEffectiveness.text = String((classProfObject.professor?.getTeachingEffectiveness())!)
            courseWorthwhile.text = String((classProfObject.classVar?.getCourseWorthwhile())!)
            
            for review in classProfObject.reviews {
                reviewItems!.append(ReviewItem(review: review))
            }
        }
    }
    
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
    
    //[image] [prof name] [class-prof overall rating]
    //placed at the top (below "overall class rating")
    var titleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var image: UIImageView = {
        var iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    var profName: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var classProfOverallRating: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        label.textColor = UIColor(red: 253/255, green: 181/255, blue: 21/255, alpha: 1) //orange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var teachingEffectiveness: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        label.textColor = UIColor(red: 253/255, green: 181/255, blue: 21/255, alpha: 1) //orange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var courseWorthwhile: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        label.textColor = UIColor(red: 253/255, green: 181/255, blue: 21/255, alpha: 1) //orange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var reviewItems: [ReviewItem]?
    
    //a stack of all the review items
    var reviewItemStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 15
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //main stack containing overall class rating, titleStack, effectiveness label, worthwhile label, and reviewItemStack
    var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 15
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(nameLabel)
        mainStack.addArrangedSubview(overallClassRating)
        mainStack.addArrangedSubview(titleStack)
        mainStack.addArrangedSubview(teachingEffectiveness)
        mainStack.addArrangedSubview(courseWorthwhile)
        mainStack.addArrangedSubview(reviewItemStack)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            mainStack.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
}
