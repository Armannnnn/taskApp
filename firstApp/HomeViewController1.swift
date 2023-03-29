//
//  HomeViewController1.swift
//  firstApp
//
//  Created by Anastasiya on 22.02.2023.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject{
    func didTapMenuButton()
    func createTaskButton()
}

let myButton = UIButton()
let centerLabel = UILabel()

class HomeViewController: UIViewController {

    weak var delegate: HomeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Мои задания"
        
        createButton()
        createCenterLabel()
        createImage()
        createBarButtonItem()
        
        

    }
    
    @objc func didTapMenuButton(){
        delegate?.didTapMenuButton()
    }
    
    @objc func createTaskButton(){
        delegate?.createTaskButton()
    }
    
    
    //MARK: - Create Bar Button Item
    
    func createBarButtonItem(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"),
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(didTapMenuButton))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(createTaskButton))

        
        navigationItem.leftBarButtonItem?.tintColor = UIColor(red: 0.20784313725, green: 0.19607843137, blue: 0.69411764705, alpha: 1)
        navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 0.20784313725, green: 0.19607843137, blue: 0.69411764705, alpha: 1)
    }
        
    // MARK: - Create Button
        
    func createButton() -> (){
        myButton.frame = CGRect(x: 0, y: 0, width: 343, height: 48)
        myButton.center = self.view.center
        myButton.layer.cornerRadius = 8
            
        myButton.backgroundColor = UIColor(red: 0.20784313725, green: 0.19607843137, blue: 0.69411764705, alpha: 1)
        myButton.setTitle("+  Создать задание", for: .normal)
        view.addSubview(myButton)
            
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        myButton.widthAnchor.constraint(equalToConstant: 343).isActive = true
        myButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    // MARK: - Create Label
        
    public func createCenterLabel() -> (){
        centerLabel.frame = CGRect(x: 28, y: 476, width: 319, height: 44)
        centerLabel.textColor = UIColor(red: 0.106, green: 0.092, blue: 0.188, alpha: 1)
        centerLabel.font = UIFont(name: "Inter-Regular", size: 18)
        centerLabel.numberOfLines = 0
        centerLabel.lineBreakMode = .byWordWrapping
        centerLabel.textAlignment = .center

        centerLabel.attributedText = NSMutableAttributedString(string: "У вас пока нет заданий.\nСоздайте первое  перейдя по кнопке", attributes: [NSAttributedString.Key.kern: -0.33])

        view.addSubview(centerLabel)
    }
    
    // MARK: - Create Image
    
    func createImage(){
        let image = UIImage(named: "Image")
        let myImage = UIImageView(image: image)
        
        myImage.frame = CGRect(x: 45, y: 135, width: 285, height: 277)
        
        view.addSubview(myImage)
    }

}
