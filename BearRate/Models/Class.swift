//
//  Class.swift
//  BearRate
//
//  Created by Jennessa Ma on 4/19/21.
//

import Foundation
import UIKit

class Class {
    
    var classNumber: Int? //official reg number
    var classTitle: String? //AEROSPC1A
    var name: String? //Foundations of the U.S. Air Force
    var overallRating: Float?
    var professors: [Professor] = []
    
    func getCourseWorthwhile() -> Float {
        //TODO: get from HKN surveys
        return 0
    }
    
}

