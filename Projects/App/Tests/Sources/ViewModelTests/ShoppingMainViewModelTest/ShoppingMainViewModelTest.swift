//
//  ShoppingMainViewModelTest.swift
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

final class ShoppingMainViewModelTest: QuickSpec {
    override class func spec() {
        var cancelBag: Set<AnyCancellable> = .init()
        var sut: ShoppingMainViewModel!
        
        //MARK: -- Input
        let viewDidLoad: PassthroughSubject<Void, Never> = .init()
        let preFetchRequest: PassthroughSubject<[Int], Never> = .init()
        let selectProduct: PassthroughSubject<Int, Never> = .init()
        
        let input = ShoppingMainViewModel.Input(
            viewDidLoad: viewDidLoad.eraseToAnyPublisher(),
            preFetchRequest: preFetchRequest.eraseToAnyPublisher(),
            selectProduct: selectProduct.eraseToAnyPublisher())
        
        //MARK: -- Output
        var output: ShoppingMainViewModel.Output!
        var callCount: Int = 0
        
        //Given
        describe("유저가 앱을 켜서 메인에 진입했다") {
            beforeEach {
                cancelBag = .init()
                let repository = ProductRepositoryMock(needFail: false)
                let useCase = ShoppingMainUseCaseImp(productRepositoryInterface: repository)
                sut = ShoppingMainViewModel(useCase: useCase)
                output = sut.transform(input: input)
                subAllOutput(output: output)
                callCount = 0
            }
            //When
            context("viewDidLoad 됐을 때") {
                var productList: [ProductModel] = .init()
                beforeEach {
                    output.productList
                        .sink(receiveValue: {
                            productList = $0
                        })
                        .store(in: &cancelBag)
                    
                    viewDidLoad.send(Void())
                }
                //Then
                it("productListData를 fetch해옵니다") {
                    expect(productList.count).to(equal(2))
                    expect(productList.first?.name).to(equal("무형광 순면 사계절 배냇슈트-신생아"))
                }
            }
            
            context("데이터가 있는 상태에서 마지막 페이지 일때 유저가 아래로 스크롤 하는 중") {
                beforeEach {
                    viewDidLoad.send(Void())
                    
                    output.productList
                        .sink(receiveValue: { _ in
                            callCount += 1
                        })
                        .store(in: &cancelBag)
                    
                    preFetchRequest.send([15])
                }
                it("신호가 방출되지 말아야 합니다") {
                    expect(callCount).to(equal(0))
                }
            }
            
            context("데이터가 있는 상태에서 유저가 Product하나를 탭 했을때") {
                var productModel: ProductModel?
                beforeEach {
                    viewDidLoad.send(Void())
                    
                    output.showProductDetailVC
                        .sink(receiveValue: { selectItem in
                            productModel = selectItem
                        })
                        .store(in: &cancelBag)
                    
                    selectProduct.send(0)
                }
                it("첫번째 아이템을 선택하면 첫번째 아이템이 와야합니다") {
                    expect(productModel?.hash).to(equal("73BC8649785CC47660AE5DC3B802CDA6"))
                }
            }
        }
        
        //Given
        describe("인터넷 연결이 끊어진 유저가 앱에 진입") {
            beforeEach {
                cancelBag = .init()
                let repository = ProductRepositoryMock(needFail: true)
                let useCase = ShoppingMainUseCaseImp(productRepositoryInterface: repository)
                sut = ShoppingMainViewModel(useCase: useCase)
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
        func subAllOutput(output: ShoppingMainViewModel.Output) {
            output.productList.sink(receiveValue: { _ in }).store(in: &cancelBag)
            output.showProductDetailVC.sink(receiveValue: { _ in }).store(in: &cancelBag)
            output.errorMessage.sink(receiveValue: { _ in }).store(in: &cancelBag)
        }
    }
}
