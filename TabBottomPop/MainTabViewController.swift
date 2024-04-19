//
//  ViewController.swift
//  TabBottomPop
//
//  Created by mac on 2024/4/19.
//

import UIKit

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
