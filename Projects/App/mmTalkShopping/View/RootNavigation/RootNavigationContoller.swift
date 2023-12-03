//
//  RootNavigationContoller.swift
//  mmTalkShopping
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import UIKit

public final class RootNavigationContoller: UINavigationController {
    public init () {
        super.init(nibName: nil, bundle: nil)
        self.isNavigationBarHidden = true
        setRootViewController()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension RootNavigationContoller {
    func setRootViewController() {
        let rootVC = MaintabBarController()
        self.viewControllers = [rootVC]
    }
}
