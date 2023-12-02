//
//  ShoppingMainViewModel.swift
//  mmTalkShopping
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Combine

import Domain

public final class ShoppingMainViewModel {
    public struct Input {
        let viewDidLoad: AnyPublisher<Void, Never>
        let preFetchRequest: AnyPublisher<[Int], Never>
        let selectProduct: AnyPublisher<Int, Never>
    }
    
    public struct Output {
        let productList: PassthroughSubject<[ProductModel], Never> = .init()
        let showProductDetailVC: PassthroughSubject<ProductModel, Never> = .init()
        let errorMessage: PassthroughSubject<String, Never> = .init()
    }
    
    //MARK: -- Dependency
    private let shoppingMainUsecase: ShoppingMainUseCase
    
    private var cancelBag: Set<AnyCancellable> = .init()
    
    //MARK: -- init()
    public init(useCase: ShoppingMainUseCase) {
        self.shoppingMainUsecase = useCase
    }
    
    //MARK: -- Public
    
    public func transform(input: Input) -> Output {
        let output = Output()
        self.bindOutput(output: output)
        
//        Publishers.Merge(input.viewDidLoad,
//                         input.preFetchRequest)
        input.viewDidLoad
            .sink(receiveValue: {
                self.shoppingMainUsecase.fetchProductList()
            })
            .store(in: &cancelBag)
        
        input.preFetchRequest
            .sink(receiveValue: {
                self.shoppingMainUsecase.prefetching($0)
            })
            .store(in: &cancelBag)
        
        input.selectProduct
            .sink(receiveValue: {
                self.shoppingMainUsecase.selectModel($0)
            })
            .store(in: &cancelBag)
        
        return output
    }
    
    public func bindOutput(output: Output) {
        self.shoppingMainUsecase
            .productList
            .sink(receiveValue: { data in
                output.productList.send(data)
            })
            .store(in: &cancelBag)
        
        self.shoppingMainUsecase
            .showProductDetailVC
            .sink(receiveValue: {
                output.showProductDetailVC.send($0)
            })
            .store(in: &cancelBag)
        
        self.shoppingMainUsecase
            .mainErrorOccurred
            .sink(receiveValue: { error in
                output.errorMessage.send(error.localizedDescription)
            })
            .store(in: &cancelBag)
    }
}
