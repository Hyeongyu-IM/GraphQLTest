//
//  ShoppingProductDetailViewModel.swift
//  mmTalkShopping
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import Combine

import Domain

public final class ShoppingProductDetailViewModel {
    public struct Input {
        let viewDidLoad: AnyPublisher<Void, Never>
        let backButtonTab: AnyPublisher<Void, Never>
    }
    
    public struct Output {
        let pageTitle: PassthroughSubject<String, Never> = .init()
        let popCurrentVC: PassthroughSubject<Void, Never> = .init()
        let errorMessage: PassthroughSubject<String, Never> = .init()
    }
    
    //MARK: -- Dependency
    private let shoppingProductDetailUseCase: ShoppingProductDetailUseCase
    
    private var cancelBag: Set<AnyCancellable> = .init()
    
    //MARK: -- init()
    public init(shoppingProductDetailUseCase: ShoppingProductDetailUseCase) {
        self.shoppingProductDetailUseCase = shoppingProductDetailUseCase
    }
    
    //MARK: -- Public
    
    public func transform(input: Input) -> Output {
        let output = Output()
        self.bindOutput(input: input, output: output)
        
        input.viewDidLoad
            .sink(receiveValue: { [weak self] _ in
                self?.shoppingProductDetailUseCase.requestProductData()
            })
            .store(in: &cancelBag)
        
        return output
    }
}

extension ShoppingProductDetailViewModel {
    private func bindOutput(input: Input, output: Output) {
        self.shoppingProductDetailUseCase
            .pageTitle
            .sink(receiveValue: { productTitle in
                output.pageTitle.send(productTitle)
            })
            .store(in: &cancelBag)
        
        input.backButtonTab
            .sink(receiveValue: {
                output.popCurrentVC.send($0)
            })
            .store(in: &cancelBag)
        
        self.shoppingProductDetailUseCase
            .mainErrorOccurred
            .sink(receiveValue: {
                output.errorMessage.send($0.localizedDescription)
            })
            .store(in: &cancelBag)
    }
}
