//
//  ViewController.swift
//  TabBottomPop
//
//  Created by mac on 2024/4/19.
//

import UIKit

class MainTabViewController: UITabBarController, UITabBarControllerDelegate {

    ///更多
    private lazy var _moreView: TabMoreView = {
        let v = TabMoreView()
        return v
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        delegate = self
        var controllers: [UIViewController] = []
        toAddController(controllers: &controllers, controller: HomeViewController(), title: "首页", defalutImg: "", selectedImg: "")
        toAddController(controllers: &controllers, controller: ContactViewController(), title: "联系人", defalutImg: "", selectedImg: "")
        toAddController(controllers: &controllers, controller: MineViewController(), title: "我的", defalutImg: "", selectedImg: "")
        toAddController(controllers: &controllers, controller: MoreViewController(), title: "更多", defalutImg: "", selectedImg: "")
        initTab(controllers: &controllers)
        
    }
    
    func toAddController(controllers: inout [UIViewController], controller: UIViewController, title: String, defalutImg: String, selectedImg: String) {
        let addNav = UINavigationController(rootViewController: controller)
        addNav.tabBarItem.title = title
        addNav.tabBarItem.image = UIImage(named: defalutImg)?.withRenderingMode(.alwaysOriginal)
        addNav.tabBarItem.selectedImage = UIImage(named: selectedImg)?.withRenderingMode(.alwaysOriginal)
        controllers.append(addNav)
    }
    
    func initTab(controllers:inout [UIViewController]) {
        viewControllers = controllers
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .white
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.08
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 5
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if viewController == viewControllers?[3] {
            
            if !view.subviews.contains(_moreView) {
//                _moreView.removeFromSuperview()
                
                view.addSubview(_moreView)
                _moreView.snp.makeConstraints { make in
                    make.top.trailing.leading.equalToSuperview()
                    make.bottom.equalToSuperview().offset(-getTabBarHeight())
                }
                    

                var items = [TabMoreView.MenuItem]()
                var number = arc4random() % 14 + 2
                print(number)
                for i in 0 ... number {
                    let item = TabMoreView.MenuItem(title: "标题\(i)", icon: UIImage(named: "111")) { [weak self] in
                        let alert = UIAlertController(title: "Alert", message: "You have selected this item   \(i)", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self?.present(alert, animated: true, completion: nil)
                    }
                    items.append(item)
                }
                _moreView.setItems(items)
            }
            
            return false
        }
        
        _moreView.bottomShow(show: false)
        return true
    }
    
}

func getTabBarHeight() -> CGFloat {
    if let tabBarController = UIApplication.shared.keyWindow?.rootViewController as? UITabBarController {
        return tabBarController.tabBar.frame.size.height
    }
    return 0.0
}


class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}


class ContactViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
}

class MineViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}



class MoreViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}
