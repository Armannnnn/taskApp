//
//  MenuViewController.swift
//  firstApp
//
//  Created by Anastasiya on 12.02.2023.
//

import UIKit

let myLabel = UILabel()

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    enum MenuOptions: String, CaseIterable{
        case Advice = "Подсказки и советы"
        case Rate = "Оценить приложение"
        case Feedback =  "Обратная связь"
        case Profile = "Профиль"
        case Exit = "Выйти"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 16, y: 144, width: view.bounds.size.width, height: view.bounds.size.height)
        tableView.separatorColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)

        tableView.delegate = self
        tableView.dataSource = self
        self.view.backgroundColor = .white
        createLabel()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = MenuOptions.allCases[indexPath.row].rawValue
        return cell
    }
    
    
    
    // MARK: - Create Label
        
    private func createLabel() -> (){
        myLabel.backgroundColor = .white
        myLabel.font = UIFont.boldSystemFont(ofSize: 30)

        myLabel.textColor = UIColor(red: 0.207, green: 0.197, blue: 0.696, alpha: 1)
        myLabel.attributedText = .init(string: "Задания")
        view.addSubview(myLabel)
            
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 72).isActive = true
        myLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32).isActive = true
        myLabel.heightAnchor.constraint(equalToConstant: 36).isActive = true
        myLabel.widthAnchor.constraint(equalToConstant: view.bounds.size.width).isActive = true

    }
    


}
