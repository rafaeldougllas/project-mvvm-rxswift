//
//  EmployeeCell.swift
//  DesignPatterns
//
//  Created by Rafael Douglas on 19/07/21.
//

import UIKit

class EmployeeCell: UITableViewCell {
    
    var employee: EmployeeData? {
        didSet {
            guard let employeeItem = employee else {return}
            //profileImageView.image = UIImage(named: name)
            nameLabel.text = employeeItem.employee_name
            var salary = employeeItem.employee_salary
            if let salaryText = formatCurrency(value: salary) {
                salaryTitleDetailedLabel.text = "\(salaryText)"
            }
            ageLabel.text = "\(employeeItem.employee_age)"
            
//            if let country = contactItem.country {
//                countryImageView.image = UIImage(named: country)
//            }
        }
    }
    
    lazy var containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    lazy var profileImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()
    
    lazy var loadingIndicator: UIActivityIndicatorView = {
        let loadingIndicator = UIActivityIndicatorView(style: .medium)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        //loadingIndicator.center = self.profileImageView.center
        return loadingIndicator
    }()
    
    lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var salaryTitleDetailedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor =  .white
        label.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var ageLabel:UILabel = {
        let ageLabel = UILabel()
        ageLabel.font = UIFont.boldSystemFont(ofSize: 14)
        ageLabel.textColor =  .white
        ageLabel.textAlignment = .center
        ageLabel.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        ageLabel.contentMode = .scaleAspectFill // without this your image will shrink and looks ugly
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.layer.cornerRadius = 8
        ageLabel.clipsToBounds = true
        return ageLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func formatCurrency(value: Int?) -> String? {
        guard value != nil else { return "$0.00" }
        let doubleValue = Double(value!)
        let formatter = NumberFormatter()
        formatter.currencyCode = "USD"
        formatter.currencySymbol = "$"
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .currencyAccounting
        return formatter.string(from: NSNumber(value: doubleValue)) ?? "$\(doubleValue)"
    }
}

extension EmployeeCell: CodeView {
    func buildViewHierarchy() {
        self.contentView.addSubview(profileImageView)
        self.contentView.addSubview(loadingIndicator)
        containerView.addSubview(nameLabel)
        containerView.addSubview(salaryTitleDetailedLabel)
        self.contentView.addSubview(containerView)
        self.contentView.addSubview(ageLabel)
    }
    
    func setupConstraints() {
        profileImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        loadingIndicator.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.profileImageView.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        salaryTitleDetailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
        salaryTitleDetailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        salaryTitleDetailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
        salaryTitleDetailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        
        ageLabel.widthAnchor.constraint(equalToConstant:24).isActive = true
        ageLabel.heightAnchor.constraint(equalToConstant:24).isActive = true
        ageLabel.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-20).isActive = true
        ageLabel.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
    }
}
