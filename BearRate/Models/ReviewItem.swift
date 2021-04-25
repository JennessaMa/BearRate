//
//  ReviewItem.swift
//  BearRate
//
//  Created by Jennessa Ma on 4/25/21.
//

import UIKit

class ReviewItem: UIView {

    var review: Review?
    
    var reviewDesc: UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.numberOfLines = 4
        lbl.textColor = .gray
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 10, weight: .regular)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var reviewData: [RatingInfo] = []
    
    var reviewDataStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    init(frame: CGRect = .zero, review: Review) {
        super.init(frame: frame)
        reviewData.append(RatingInfo(title: "Difficulty", value: review.difficulty!))
        reviewData.append(RatingInfo(title: "Workload", value: review.workload!))
        reviewData.append(RatingInfo(title: "Clarity", value: review.clarity!))
        reviewData.append(RatingInfo(title: "Helpfulness", value: review.helpfulness!))
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
        addSubview(reviewDesc)
        for data in reviewData {
            reviewDataStack.addArrangedSubview(data)
        }
        addSubview(reviewDataStack)
        
        NSLayoutConstraint.activate([
            reviewDesc.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            reviewDesc.leadingAnchor.constraint(equalTo: leadingAnchor),
            reviewDesc.trailingAnchor.constraint(equalTo: trailingAnchor),
            reviewDataStack.topAnchor.constraint(equalTo: reviewDesc.bottomAnchor, constant: 5),
            reviewDataStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            reviewDataStack.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
