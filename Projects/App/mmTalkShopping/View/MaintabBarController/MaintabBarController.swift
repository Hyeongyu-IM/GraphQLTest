//
//  MaintapbarController.swift
//  mmTalkShopping
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import UIKit

import Domain

public final class MaintabBarController: UITabBarController {
    enum TabBar {
        case shopping
        case myPage
        
        var title: String {
            switch self {
            case .shopping: return "쇼핑몰"
            case .myPage: return "내정보"
            }
        }
        
        var image: UIImage? {
            switch self {
            case .shopping: 
                return MmTalkShoppingAsset.shoppingBagOff.image
            case .myPage: return UIImage(systemName: "person")
            }
        }
        
        var selectedImage: UIImage? {
            switch self {
            case .shopping: 
                return MmTalkShoppingAsset.shoppingBagOn.image
            case .myPage: return UIImage(systemName: "person.fill")
            }
        }
    }
    //MARK: -- Dependency
    private let vcBuilder: ViewControllerBuilder = .shared
    
    //MARK: -- Controllers
    private let shoppingMainVC: ShoppingMainVC
    private let myPageVC: UIViewController
    
    public init() {
        shoppingMainVC = vcBuilder.shoppingMainVC()
        myPageVC = vcBuilder.myPageVC()
        super.init(nibName: nil, bundle: nil)
        setAttribute()
        setControllers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MaintabBarController {
    private func setControllers() {
        let viewControllers = [createTabBarItem(title: TabBar.shopping.title,
                                                image: TabBar.shopping.image,
                                                selectedImage: TabBar.shopping.selectedImage,
                                                viewController: shoppingMainVC),
                               createTabBarItem(title: TabBar.myPage.title,
                                                image: TabBar.myPage.image,
                                                selectedImage: TabBar.myPage.selectedImage,
                                                viewController: myPageVC)]
        setViewControllers(viewControllers, animated: false)
    }
    
    private func setAttribute() {
        tabBar.barTintColor = UIColor(patternImage: .init())
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
        tabBar.unselectedItemTintColor = .label
        tabBar.tintColor = .label
        addSingleLine()
    }
    
    private func createTabBarItem(title: String, image: UIImage?, selectedImage: UIImage?, viewController: UIViewController) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 12)],
                                                         for: .normal)
        viewController.tabBarItem.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 12)],
                                                         for: .selected)
        viewController.tabBarItem.image = image
        viewController.tabBarItem.selectedImage = selectedImage
        return viewController
    }
    
    private func addSingleLine() {
        let view = UIView().then {
            $0.backgroundColor = .systemGray5
        }
        tabBar.addSubview(view)
        
        view.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(tabBar.snp.top)
        }
    }
}
