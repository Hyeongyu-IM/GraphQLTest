//
//  ViewControllerBuilder.swift
//  mmTalkShopping
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Foundation
import Core
import Domain

final class ViewControllerBuilder {
    static let shared: ViewControllerBuilder = .init()
    
    @Injected var productRepository: ProductRepositoryInterface
    
    private init() {}
    

}
