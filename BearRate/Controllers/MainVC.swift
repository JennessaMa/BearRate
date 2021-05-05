//
//  MainVC.swift
//  BearRate
//
//  Created by Jennessa Ma on 5/4/21.
//

import UIKit

class MainVC: UIViewController, UITabBarControllerDelegate {
    
    let profVC = ProfessorListVC()
    let classVC = ClassListVC()

    var tabBar: UITabBarController  = UITabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.delegate = self
        let profItem = UITabBarItem()
        profItem.title = "Professors"
        profItem.image = UIImage(systemName: "person.circle")
        profVC.tabBarItem = profItem
        
        let classItem = UITabBarItem()
        classItem.title = "Classes"
        classItem.image = UIImage(systemName: "pencil")
        classVC.tabBarItem = classItem
        
        tabBar.viewControllers = [profVC, classVC]
        tabBar.selectedViewController = profVC
        tabBar.selectedIndex = 0
    }
    
}

