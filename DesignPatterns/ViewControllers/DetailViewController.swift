//
//  DetailViewController.swift
//  DesignPatterns
//
//  Created by Rafael Douglas on 21/07/21.
//

import UIKit

class DetailViewController: UIViewController {
    var employee: EmployeeData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let datailView = DetailView()
        guard let employee = employee else { return }
        datailView.updateView(employee: employee)
        view = datailView
    }
}
