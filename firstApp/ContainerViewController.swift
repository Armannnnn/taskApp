
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
    
}

