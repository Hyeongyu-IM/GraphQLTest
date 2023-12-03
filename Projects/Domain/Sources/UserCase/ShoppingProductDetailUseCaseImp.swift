//
//  ShoppingProductDetailUseCaseImp.swift
//  Domain
//
//  Created by 임현규 on 12/3/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Foundation
import Combine

import Core

import GraphQLAPI

public protocol ShoppingProductDetailUseCase {
    var pageTitle: PassthroughSubject<String, Never> { get }
    var mainErrorOccurred: PassthroughSubject<mmTalkError, Never> { get }
    
    func requestProductData()
}

public final class ShoppingProductDetailUseCaseImp {
    //MARK: -- Dependency
    private let productRepository: ProductRepositoryInterface
    private var cancellable: Set<AnyCancellable> = .init()
    
    private let productID: String
    
    //MARK: -- Output
    public let pageTitle: PassthroughSubject<String, Never> = .init()
    public let mainErrorOccurred: PassthroughSubject<mmTalkError, Never> = .init()
    
    //MARK: -- init()
    public init(productRepositoryInterface: ProductRepositoryInterface,
                productID: String) {
        self.productRepository = productRepositoryInterface
        self.productID = productID
    }
}

extension ShoppingProductDetailUseCaseImp: ShoppingProductDetailUseCase {
    public func requestProductData() {
        productRepository
            .fetchProduct(hash: productID)
            .sink(receiveCompletion: { [weak self] event in
                if case Subscribers.Completion.failure = event {
                    self?.mainErrorOccurred.send(mmTalkError.networkError)
                }},
                  receiveValue: { [weak self] productModel in
                self?.pageTitle.send(productModel.name)
            })
            .store(in: &cancellable)
    }
}
