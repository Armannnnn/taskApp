

import UIKit

protocol CreateTaskViewControllerDelegate: AnyObject{
    func close()
}


class CreateTaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    enum TaskOptions: String, CaseIterable{
        case Duration = "Продолжительность"
        case Notification =  "Уведомления"
    }
    
    private let taskLabel = UILabel()
    private let sampleTextField =  UITextField()
    private let nameLabel = UILabel()
    private let themeLabel = UILabel()
    private let addButton = UIButton()
    private let blueCircle = CircleView(color: UIColor(red: 0.875, green: 0.468, blue: 0.339, alpha: 1))
    private let redCircle = CircleView(color: .red)
    private let greenCircle = CircleView(color: .green)
    private let colors: [UIColor] = [UIColor(red: 0.875, green: 0.468, blue: 0.339, alpha: 1),
                                     UIColor(red: 0.904, green: 0.753, blue: 0.365, alpha: 1),
                                     UIColor(red: 0.361, green: 0.867, blue: 0.442, alpha: 1),
                                     UIColor(red: 0.4, green: 0.748, blue: 1, alpha: 1),
                                     UIColor(red: 0.323, green: 0.817, blue: 0.58, alpha: 1),
                                     UIColor(red: 0.4, green: 0.496, blue: 1, alpha: 1),
                                     UIColor(red: 0.628, green: 0.4, blue: 1, alpha: 1),
                                     UIColor(red: 0.767, green: 0.316, blue: 0.722, alpha: 1)]
    
    private var circles: [CircleView] = []


    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Новое задание"
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "multiply"),
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(close))

        taskNameLabel()
        textField()
        taskSettingsLabel()
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .white
        
        addTaskButton()
        colorThemeLabel()
        
        for (index, value) in colors.enumerated(){
            let circle = CircleView(color: value)
            switch index{
            case _ where index < 4:
                circle.frame = CGRect(x: 16 + CGFloat(index) * 100, y: 400, width: 60, height: 60)
                view.addSubview(circle)
                circles.append(circle)
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
                            circle.addGestureRecognizer(tapGesture)
            case _ where index >= 4:
                circle.frame = CGRect(x: 16 + CGFloat(index - 4) * 100, y: 476, width: 60, height: 60)
                view.addSubview(circle)
                circles.append(circle)
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
                            circle.addGestureRecognizer(tapGesture)
            default: break
            }

        }
        
    }

@objc private func handleTap(_ sender: UITapGestureRecognizer) {
    guard let circle = sender.view as? CircleView else { return }
    circles.forEach { $0.isSelected = false }
        circle.isSelected = true
}
    
    // MARK: = NameLabel
    
    private func taskNameLabel(){
        nameLabel.backgroundColor = .white
        nameLabel.textColor = UIColor(red: 0.106, green: 0.092, blue: 0.188, alpha: 1)
        nameLabel.font = UIFont(name: "Inter-Regular", size: 16)
        nameLabel.text = "Название"
        
        view.addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
    }
    
    // MARK: = TextField
    
    private func textField(){
        sampleTextField.font = UIFont(name: "Inter-Regular", size: 16)
        sampleTextField.placeholder = "Зарядка, чтение и т д"
        
        view.addSubview(sampleTextField)
        
        sampleTextField.translatesAutoresizingMaskIntoConstraints = false
        sampleTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        sampleTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
    }
    
    // MARK: = TaskSettingsLabel

    private func taskSettingsLabel(){
        taskLabel.backgroundColor = .white
        taskLabel.textColor = UIColor(red: 0.106, green: 0.092, blue: 0.188, alpha: 1)
        taskLabel.font = UIFont(name: "Inter-Regular", size: 16)
        taskLabel.text = "Настройки задания"
        
        view.addSubview(taskLabel)
        
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        taskLabel.topAnchor.constraint(equalTo: sampleTextField.bottomAnchor, constant: 28).isActive = true
        taskLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
    }
    
    // MARK: = TableView

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomTableViewCell.self,
                           forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.register(SwitchCell.self,
                           forCellReuseIdentifier: SwitchCell.identifier)

        
        return tableView
    }()
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 4, y: 216, width: view.bounds.size.width - 8, height: view.bounds.size.height)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: taskLabel.bottomAnchor, constant: 8).isActive = true

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskOptions.allCases.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell  else { return UITableViewCell() }
            
            cell.textLabel?.text = TaskOptions.allCases[indexPath.row].rawValue
            cell.selectionStyle = .none

        }
        else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchCell.identifier, for: indexPath) as? SwitchCell  else { return UITableViewCell() }
            
            cell.textLabel?.text = TaskOptions.allCases[indexPath.row].rawValue
            cell.selectionStyle = .none

        }
        
        return UITableViewCell()
    }
    
    // MARK: = CreateLabelTask

    private func colorThemeLabel(){
        themeLabel.backgroundColor = .white
        themeLabel.textColor = UIColor(red: 0.106, green: 0.092, blue: 0.188, alpha: 1)
        themeLabel.font = UIFont(name: "Inter-Regular", size: 16)
        themeLabel.text = "Цветовая тема задания"
        
        view.addSubview(themeLabel)
        
        themeLabel.translatesAutoresizingMaskIntoConstraints = false
        themeLabel.bottomAnchor.constraint(equalTo: addButton.bottomAnchor, constant: -384).isActive = true
        themeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
    }
    
    // MARK: = AddButton

    func addTaskButton() -> (){
        addButton.center = self.view.center
        addButton.layer.cornerRadius = 8
            
        addButton.backgroundColor = UIColor(red: 0.20784313725, green: 0.19607843137, blue: 0.69411764705, alpha: 1)
        addButton.setTitle("+  Добавить", for: .normal)
        addButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        view.addSubview(addButton)
            
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 343).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    
    @objc func close(){
        self.dismiss(animated: true)
//        if let firstVC = presentingViewController as? CreateTaskViewController{
//            DispatchQueue.main.async {
//                firstVC.tableView.reloadData()
//            }
//        }
    }
}
