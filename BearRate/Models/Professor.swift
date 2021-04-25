//
//  Professor.swift
//  BearRate
//
//  Created by Jennessa Ma on 4/19/21.
//

import Foundation
import UIKit

class Professor {
    
    var name: String?
    var image: UIImage?
    var overallRating: Float?
    var classes: [Class]?
    
    //gets the avg difficulty of this professor teaching a specified class
    func getAvgDifficulty(classNumber: Int) -> Float {
        //TODO
        return 0
    }
    
    func getAvgWorkload(classNumber: Int) -> Float {
        //TODO
        return 0
    }
    
    func getAvgClarity(classNumber: Int) -> Float {
        //TODO
        return 0
    }
    
    func getAvgHelpfulness(classNumber: Int) -> Float {
        //TODO
        return 0
    }
    
    func getTeachingEffectiveness() -> Float {
        //TODO: get from HKN surveys
        return 0
    }
    
}
