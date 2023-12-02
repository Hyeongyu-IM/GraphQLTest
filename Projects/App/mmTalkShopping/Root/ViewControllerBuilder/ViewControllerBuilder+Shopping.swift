//
//  ViewControllerBuilder+Shopping.swift
//  mmTalkShopping
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Foundation
import Core
import Domain

extension ViewControllerBuilder {
    func shoppingMainVC() -> ShoppingMainVC {
        let shoppingMainUseCase = ShoppingMainUseCaseImp(productRepositoryInterface: productRepository)
        let viewModel = ShoppingMainViewModel(useCase: shoppingMainUseCase)
        return ShoppingMainVC(viewModel: viewModel)
    }
}
