//
//  CustomTabBarController.swift
//  ProjectGNT_iOS_ver3
//
//  Created by jjudy on 2022/08/19.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        self.delegate = self
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let tabOne = MainViewController()
        let tabOneBarItem = UITabBarItem(title: "홈", image: #imageLiteral(resourceName: "tabBarIcon_Home"), tag: 0)
        tabOne.tabBarItem = tabOneBarItem
        
        let tabTwo = SearchViewController()
        let tabTwoBarItem = UITabBarItem(title: "검색", image: #imageLiteral(resourceName: "tabBarIcon_search"), tag: 0)
        tabTwo.tabBarItem = tabTwoBarItem
        
        let tabThree = MainViewController()
        let tabThreeBarItem = UITabBarItem(title: "랭킹", image: #imageLiteral(resourceName: "tabBarIcon_rank"), tag: 0)
        tabThree.tabBarItem = tabThreeBarItem
        
        let tabFour = MainViewController()
        let tabFourBarItem = UITabBarItem(title: "마이페이지", image: #imageLiteral(resourceName: "tabBarIcon_user"), tag: 0)
        tabFour.tabBarItem = tabFourBarItem
        
        self.viewControllers = [tabOne, tabTwo, tabThree, tabFour]
    }
    
}
