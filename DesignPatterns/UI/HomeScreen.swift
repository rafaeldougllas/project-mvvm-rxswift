//
//  HomeScreen.swift
//  DesignPatterns
//
//  Created by Rafael Douglas on 08/06/21.
//
import UIKit

final class HomeScreen: UIView {
    
    lazy var button: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("fech", for: .normal)
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    init() {
       super.init(frame: .zero)
       setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeScreen: CodeView {
    func buildViewHierarchy() {
        addSubview(table)
    }
    
    func setupConstraints() {
        table.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        table.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        table.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .darkGray
    }
}

    
