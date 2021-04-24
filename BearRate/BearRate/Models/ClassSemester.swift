//
//  ClassSemester.swift
//  BearRate
//
//  Created by Jacob Pashman on 4/24/21.
//

import UIKit

class ClassSemester {
	var classVar: Class!
	var professor: Professor!
	var semester: String!
	
	init(classVar: Class, professor: Professor, semester: String) {
		self.classVar = classVar
		self.professor = professor
		self.semester = semester
	}
	
}
