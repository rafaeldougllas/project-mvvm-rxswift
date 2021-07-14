//
//  ViewController.swift
//  DesignPatterns
//
//  Created by Rafael Douglas on 06/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    var characters = ["Link", "Zelda", "Ganondorf", "Midna"]
    
    var homeScreen = HomeScreen()
    
    lazy var viewModel: ViewModel = {
        return ViewModel()
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        view = homeScreen
        
        homeScreen.table.dataSource = self
        homeScreen.table.delegate = self
        
        initViewModel()
    }
    
    func initViewModel() {
        
        // Setup for reloadTableViewClosure
        viewModel.reloadTableViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.homeScreen.table.reloadData()
            }
        }
        
        viewModel.fetchData()
    }
    
    
    @objc func click(){
        print("Clicou!!!!")
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let employee = viewModel.getData(at: indexPath)
        cell.textLabel?.text = employee.employee_name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let employee = viewModel.getData(at: indexPath)
        print(employee)
    }
}
