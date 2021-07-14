//
//  HomeViewController.swift
//  DesignPatterns
//
//  Created by Rafael Douglas on 06/05/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeScreen = HomeScreen()
    
    lazy var homeViewModel: HomeViewModel = {
        return HomeViewModel()
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
        homeViewModel.reloadTableViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.homeScreen.table.reloadData()
            }
        }
        
        homeViewModel.fetchData()
    }
    
    
    @objc func click(){
        print("Clicou!!!!")
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.numberOfItems
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let employee = homeViewModel.getData(at: indexPath)
        cell.textLabel?.text = employee.employee_name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let employee = homeViewModel.getData(at: indexPath)
        print(employee)
    }
}
