//
//  ShoppinProductDetailViewModelTest.swift
//  mmTalkShoppingTests
//
//  Created by 임현규 on 12/3/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import XCTest
import Combine

import Core
import Domain
import Data

import Quick
import Nimble

@testable import mmTalkShopping

final class ShoppinProductDetailViewModelTest: QuickSpec {
    override class func spec() {
        var cancelBag: Set<AnyCancellable> = .init()
        var sut: ShoppingProductDetailViewModel!
        
        //MARK: -- Input
        let viewDidLoad: PassthroughSubject<Void, Never> = .init()
        let backButtonTab: PassthroughSubject<Void, Never> = .init()
        
        let input = ShoppingProductDetailViewModel.Input(
            viewDidLoad: viewDidLoad.eraseToAnyPublisher(),
            backButtonTab: backButtonTab.eraseToAnyPublisher())
        
        //MARK: -- Output
        var output: ShoppingProductDetailViewModel.Output!
        var callCount: Int = 0
        
        //Given
        describe("유저가 앱을 켜서 메인에 진입했다") {
            beforeEach {
                cancelBag = .init()
                let repository = ProductRepositoryMock(needFail: false)
                let useCase = ShoppingProductDetailUseCaseImp(productRepositoryInterface: repository,
                                                              productID: "123456789")
                sut = ShoppingProductDetailViewModel(shoppingProductDetailUseCase: useCase)
                output = sut.transform(input: input)
                subAllOutput(output: output)
                callCount = 0
            }
            
            context("viewDidLoad 됐을 때") {
                var productTitle: String = "" {
                    didSet {
                        print("productTitle \(productTitle)")
                    }
                }
                beforeEach {
                    output.pageTitle
                        .sink(receiveValue: {
                            productTitle = $0
                        })
                        .store(in: &cancelBag)
                    
                    viewDidLoad.send(Void())
                }
                it("productListData를 fetch해옵니다") {
                    expect(productTitle).to(equal("무형광 순면 사계절 배냇슈트-신생아"))
                }
            }
            
            context("backButtonTap") {
                beforeEach {
                    output.popCurrentVC
                        .sink(receiveValue: {
                            callCount += 1
                        })
                        .store(in: &cancelBag)
                    
                    backButtonTab.send(Void())
                }
                it("popVC CallCount = 1") {
                    expect(callCount).to(equal(1))
                }
            }
        }
        
        //Given
        describe("인터넷 연결이 끊어진 유저가 앱에 진입") {
            beforeEach {
                cancelBag = .init()
                let repository = ProductRepositoryMock(needFail: true)
                let useCase = ShoppingProductDetailUseCaseImp(productRepositoryInterface: repository,
                                                              productID: "123456789")
                sut = ShoppingProductDetailViewModel(shoppingProductDetailUseCase: useCase)
                output = sut.transform(input: input)
                subAllOutput(output: output)
                callCount = 0
            }
            //When
            context("viewDidLoad 됐을 때") {
                var errorMessage: String = ""
                beforeEach {
                    output.errorMessage
                        .sink(receiveValue: {
                            print("errorMessage \($0)")
                            errorMessage = $0
                        })
                        .store(in: &cancelBag)
                        
                    viewDidLoad.send(Void())
                }
                //Then
                it("networkError Message 방출") {
                    expect(errorMessage).to(equal("네트워크 오류가 발생했습니다"))
                }
            }
        }
        
        ///VC LoadView에서 바인드 해주는 것과 같은 동작
        func subAllOutput(output: ShoppingProductDetailViewModel.Output) {
            output.pageTitle.sink(receiveValue: { _ in }).store(in: &cancelBag)
            output.popCurrentVC.sink(receiveValue: { _ in }).store(in: &cancelBag)
            output.errorMessage.sink(receiveValue: { _ in }).store(in: &cancelBag)
        }
    }
}

