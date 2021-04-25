//
//  ProfessorVC.swift
//  BearRate
//
//  Created by Jennessa Ma on 4/19/21.
//

import UIKit

class ProfessorVC: UIViewController {
    //a professor can teach many classes
    //clicking on one of the classes -> ClassProfessorVC
    
    var professor: Professor? {
        didSet {
            guard let professor = professor else { return }
            image.image = professor.image
            overallRateLabel.text = String(professor.overallRating ?? 0) //convert to stars?
            for c in professor.classes! {
                classNames?.append(c.name!)
                var data: [RatingInfo] = []
                //TODO: fill in avg functions in Professor class
                data.append(RatingInfo(title: "Difficulty", value: (professor.getAvgDifficulty(classNumber: c.classNumber!))))
                data.append(RatingInfo(title: "Workload", value: (professor.getAvgWorkload(classNumber: c.classNumber!))))
                data.append(RatingInfo(title: "Clarity", value: (professor.getAvgClarity(classNumber: c.classNumber!))))
                data.append(RatingInfo(title: "Helpfulness", value: (professor.getAvgHelpfulness(classNumber: c.classNumber!))))
                classData?.append(data)
            }
            //create classItems for the stack
            for i in 0..<classData!.count {
                classStackItems?.append(ClassItem(className: classNames![i], ratingInfo: classData![i]))
            }
        }
    }
    
    var nameLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.textAlignment = .center
        label.textColor = UIColor(red: 47/255, green: 77/255, blue: 184/255, alpha: 1) //navy blue
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var image: UIImageView = {
        var iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    var overallRateLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = UIColor(red: 253/255, green: 181/255, blue: 21/255, alpha: 1) //orange
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var classNames: [String]?
    
    var classData: [[RatingInfo]]?
    
    var classStackItems: [ClassItem]?
    
    var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(nameLabel)
        view.addSubview(image)
        view.addSubview(overallRateLabel)
        view.addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            image.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            overallRateLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            overallRateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            overallRateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            mainStack.topAnchor.constraint(equalTo: overallRateLabel.bottomAnchor, constant: 30),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
    }
    

}
