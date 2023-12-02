//
//  ShoppingMainUsecase.swift
//  mmTalkShopping
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Foundation
import Combine

import Core

import GraphQLAPI

public protocol ShoppingMainUseCase {
    var productList: CurrentValueSubject<[ProductModel], Never> { get }
    var mainErrorOccurred: PassthroughSubject<Error, Never> { get }
    
    func fetchProductList()
}

public final class ShoppingMainUseCaseImp {
    //MARK: -- Dependency
    private let productRepository: ProductRepositoryInterface
    private var cancellable: Set<AnyCancellable> = .init()
    
    private var productListMetaModel: MetaModel?
    
    //MARK: -- Public
    public let productList: CurrentValueSubject<[ProductModel], Never> = .init([])
    public let mainErrorOccurred: PassthroughSubject<Error, Never> = .init()
    
    //MARK: -- init()
    public init(productRepositoryInterface: ProductRepositoryInterface) {
        self.productRepository = productRepositoryInterface
    }
}

extension ShoppingMainUseCaseImp: ShoppingMainUseCase {
    public func fetchProductList() {
        Just(productListMetaModel)
            .replaceNil(with: MetaModel.init(offset: 0, limit: 20, isFinal: false))
            .filter { $0.isFinal == false }
            .map { ProductListOptions(offset: $0.offset, limit: $0.limit) }
            .flatMap(productRepository.fetchProductList)
            .sink(receiveCompletion: { [weak self] event in
                if case Subscribers.Completion.failure = event {
                    self?.mainErrorOccurred.send(mmTalkError.networkError)
                }
            }, receiveValue: { [weak self] model in
                self?.productListMetaModel = model.meta
                let currentValue = self?.productList.value ?? []
                self?.productList.send(currentValue + model.products)
            })
            .store(in: &cancellable)
    }
}
