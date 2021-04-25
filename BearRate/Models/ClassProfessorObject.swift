//
//  ClassProfessorObject.swift
//  BearRate
//
//  Created by Jennessa Ma on 4/25/21.
//  encapsulates all data needed for a class taught by a specified professor and their reviews
//

import Foundation

class ClassProfessorObject {
    var professor: Professor?
    var classVar: Class?
    var reviews: [Review] = []
    
    //TODO: get the overall rating for this professor teaching this class
    func getOverallRating() -> Float {
        //average of all data points?
        return 0
    }
}
