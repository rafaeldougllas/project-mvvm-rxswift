//
//  ViewModel.swift
//  DesignPatterns
//
//  Created by Rafael Douglas on 07/07/21.
//

import Foundation

class ViewModel: NSObject {
    private var apiService : APIService!
    
    // MARK: - Closures
    
    // Through these closures, our view model will execute code while some events will occure
    // They will be set up by the view controller
    var reloadTableViewClosure: (()->())?
    
    // MARK: - Properties
    
    // This will contain info about the picture eventually selectded by the user by tapping an item on the screen
    var selectedEmployee: EmployeeData?
    
    // The collection that will contain our fetched data
    private var employees: [EmployeeData] = [EmployeeData]() {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    
    // A property containing the number ot items, it will be used by the view controller to render items on the screen using a
    var numberOfItems: Int {
        return employees.count
    }
    
    override init() {
        super.init()
        self.apiService =  APIService()
    }
    
    func fetchData() {
        self.apiService.apiToGetEmployeeData { (empData) in
            self.employees = empData.data
        }
    }
    
    // MARK: - Retieve Data
    
    func getData( at indexPath: IndexPath ) -> EmployeeData {
        return employees[indexPath.row]
    }
}
