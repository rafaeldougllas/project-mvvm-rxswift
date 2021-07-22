//
//  DetailView.swift
//  DesignPatterns
//
//  Created by Rafael Douglas on 21/07/21.
//

import UIKit

final class DetailView: UIView {
    
    lazy var contentView: UIView = {
        var contentView = UIView(frame: .zero)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .blue
        return contentView
    }()
    
    lazy var nameLbl: UILabel = {
        var nameLbl = UILabel()
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        nameLbl.textColor = .white
        return nameLbl
    }()
    
    init() {
       super.init(frame: .zero)
       setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(employee: EmployeeData) {
        nameLbl.text = employee.employee_name
    }
}

extension DetailView: CodeView {
    func buildViewHierarchy() {
        addSubview(contentView)
        contentView.addSubview(nameLbl)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            nameLbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLbl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}
