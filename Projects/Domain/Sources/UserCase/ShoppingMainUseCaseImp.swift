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
    var showProductDetailVC: PassthroughSubject<ProductModel, Never> { get }
    var mainErrorOccurred: PassthroughSubject<mmTalkError, Never> { get }
    
    func fetchProductList()
    func prefetching(_ indexPaths: [Int])
    func selectModel(_ selectIndex: Int)
}

public final class ShoppingMainUseCaseImp {
    //MARK: -- Dependency
    private let productRepository: ProductRepositoryInterface
    private var cancellable: Set<AnyCancellable> = .init()
    
    private var productListMetaModel: MetaModel?
    
    //MARK: -- Output
    public let productList: CurrentValueSubject<[ProductModel], Never> = .init([])
    public let showProductDetailVC: PassthroughSubject<ProductModel, Never> = .init()
    public let mainErrorOccurred: PassthroughSubject<mmTalkError, Never> = .init()
    
    //MARK: -- init()
    public init(productRepositoryInterface: ProductRepositoryInterface) {
        self.productRepository = productRepositoryInterface
    }
}

extension ShoppingMainUseCaseImp: ShoppingMainUseCase {
    public func fetchProductList() {
        if let productListMetaModel,
           productListMetaModel.isFinal == false {
            self.productListMetaModel?.plusOnePage()
        }
        
        Just(productListMetaModel)
            .replaceNil(with: MetaModel.init(offset: 0, limit: Constants.countPerPage, isFinal: false))
            .filter { $0.isFinal == false }
            .map { ProductListOptions(offset: $0.offset, limit: $0.limit) }
            .removeDuplicates()
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
    
    public func prefetching(_ indexPaths: [Int]) {
        guard let currentPage = self.productListMetaModel?.offset else { return }
        let limitIndexRow = (currentPage + 1) * Constants.countPerPage - 10
        if indexPaths.contains(where: { limitIndexRow > $0 }) == true {
            fetchProductList()
        }
    }
    
    public func selectModel(_ selectIndex: Int) {
        guard let selectItem = self.productList.value[safeIndex: selectIndex] else { return }
        self.showProductDetailVC.send(selectItem)
    }
}

extension ShoppingMainUseCaseImp {
    enum Constants {
        ///API 요청시 한 페이지당 모델의 개수
        static let countPerPage: Int = 20
    }
}
