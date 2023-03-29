//
//  ContainerViewController.swift
//  firstApp
//
//  Created by Anastasiya on 04.02.2023.
//

import UIKit


class ContainerViewController: UIViewController {
    
    let menuVC = MenuViewController()
    let homeVC = HomeViewController()
    let createTaskVC = CreateTaskViewController()
    var navVC: UINavigationController?
    
    enum MenuState{
        case opened
        case closed
    }
    
    private var menuState: MenuState = .closed
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChildVCs()
     }
            
    // MARK: - ChildVC
        
    private func addChildVCs (){
        addChild(createTaskVC)
        view.addSubview(createTaskVC.view)
        createTaskVC.didMove(toParent: self)
        
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
            
        homeVC.delegate = self
        let navVC = UINavigationController(rootViewController: homeVC)
        addChild(navVC)
        view.addSubview(navVC.view)
        navVC.didMove(toParent: self)
        self.navVC = navVC
    }
}

extension ContainerViewController: HomeViewControllerDelegate, CreateTaskViewControllerDelegate{
    func didTapMenuButton(){
        switch menuState{
        case .closed:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut){
                self.navVC?.view.frame.origin.x = self.homeVC.view.frame.size.width - 82
                self.homeVC.view.backgroundColor = .gray
                
            } completion: {
                [weak self] done in
                    if done{
                        self?.menuState = .opened
                }
            }

        case .opened:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut){
                self.navVC?.view.frame.origin.x = 0
                self.homeVC.view.backgroundColor = .white

            } completion: {
                [weak self] done in
                    if done{
                        self?.menuState = .closed
                }
            }
        }
    }

    func createTaskButton(){
        self.present(UINavigationController(rootViewController: createTaskVC), animated: true, completion: nil)
        
    }
    
    func close() {
        createTaskVC.dismiss(animated: true)
        let lsad = UIButton()
        lsad.setTitle("adslda;", for: .normal)
        lsad.backgroundColor = .black
        lsad.translatesAutoresizingMaskIntoConstraints = false
        lsad.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lsad.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        lsad.widthAnchor.constraint(equalToConstant: 343).isActive = true
        lsad.heightAnchor.constraint(equalToConstant: 48).isActive = true
        homeVC.view.addSubview(lsad)
    }
    
}

