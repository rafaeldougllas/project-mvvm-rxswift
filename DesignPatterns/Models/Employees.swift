//
//  Employees.swift
//  DesignPatterns
//
//  Created by Rafael Douglas on 07/07/21.
//

import Foundation

// MARK: - Welcome
struct Employees: Decodable {
    let status, message: String
    let data: [EmployeeData]
}

// MARK: - Datum
struct EmployeeData: Decodable {
    let employee_name, profile_image: String
    let id, employee_salary, employee_age: Int
}
