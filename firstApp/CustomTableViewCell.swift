//
//  CustomTableViewCell.swift
//  firstApp
//
//  Created by Anastasiya on 27.02.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 64, left: 10, bottom: 52, right: 10))

        contentView.layer.borderColor = CGColor(red: 0.892, green: 0.892, blue: 0.892, alpha: 1)
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 10
    }
}

class SwitchCell: UITableViewCell {

    static let identifier = "SwitchCell"
    
    private let _switch: UISwitch = {
        let _switch = UISwitch()
        return _switch
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(_switch)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        _switch.translatesAutoresizingMaskIntoConstraints = false
        _switch.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        _switch.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        _switch.widthAnchor.constraint(equalToConstant: 50).isActive = true
        _switch.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 64, left: 10, bottom: 52, right: 10))

        contentView.layer.borderColor = CGColor(red: 0.892, green: 0.892, blue: 0.892, alpha: 1)
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 10
    }
}
