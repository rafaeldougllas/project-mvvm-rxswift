//
//  HomeViewController.swift
//  DesignPatterns
//
//  Created by Rafael Douglas on 06/05/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeView = HomeView()
    
    lazy var homeViewModel: HomeViewModel = {
        return HomeViewModel()
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        view = homeView
        
        homeView.table.dataSource = self
        homeView.table.delegate = self
        
        homeView.table.register(EmployeeCell.self, forCellReuseIdentifier: "employeesCell")
        
        initViewModel()
    }
    
    func initViewModel() {
        
        // Setup for reloadTableViewClosure
        homeViewModel.reloadTableViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.homeView.table.reloadData()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeesCell", for: indexPath) as! EmployeeCell
        
        let employee = homeViewModel.getData(at: indexPath)
        cell.employee = employee
        
        cell.loadingIndicator.startAnimating()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let employee = homeViewModel.getData(at: indexPath)
        let detailViewController = DetailViewController()
        detailViewController.employee = employee
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
