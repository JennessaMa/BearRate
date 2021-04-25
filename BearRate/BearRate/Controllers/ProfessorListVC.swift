//
//  ProfessorListVC.swift
//  BearRate
//
//  Created by Jennessa Ma on 4/19/21.
//

import UIKit

class ProfessorListVC: UIViewController {

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
    
    var professorItems: [ProfessorListItem]? {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}
