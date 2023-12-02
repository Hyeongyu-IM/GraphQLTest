//
//  RegisterDependencies.swift
//  mmTalkShopping
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Core

import Domain
import Data
import Networks

extension AppDelegate {
    var container: DIContainer {
        DIContainer.shared
    }
    ///Dependency Inject to Container
    func registerDependencies() {
        container.register(interface: ProductRepositoryInterface.self,
                           implement: {
            ProductRepository(
                productRepositoryProvider: ProductProvider()
            )
        })
    }
}
