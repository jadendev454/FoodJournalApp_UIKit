//
//  CustomTabBar.swift
//  FoodJournalApp_UIKit
//
//  Created by IACD 05 on 2022/11/25.
//

import UIKit

class CustomTabBar: UITabBarController, UITabBarControllerDelegate {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.delegate = self
        self.selectedIndex = 0
        setCenterButton()
    }

    
    func setCenterButton() {
        let middleBtn = UIButton(frame: CGRect(x: self.view.bounds.width / 2, y: -20, width: 60, height: 60))
        
        middleBtn.setBackgroundImage(UIImage(named: "home-icon-bg"), for: .normal)
        middleBtn.layer.shadowColor = UIColor.black.cgColor
        middleBtn.layer.shadowOpacity = 0.1
        middleBtn.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        self.tabBar.addSubview(middleBtn)
        middleBtn.addTarget(self, action: #selector(menubtnAction), for: .touchUpInside)
        
        self.view.layoutIfNeeded()
    }
    
    @objc func menubtnAction(sender: UIButton){
        self.selectedIndex = 1
    }

}