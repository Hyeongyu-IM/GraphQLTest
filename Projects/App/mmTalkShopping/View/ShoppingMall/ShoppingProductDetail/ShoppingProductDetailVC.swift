//
//  ShoppingProductDetailVC.swift
//  mmTalkShopping
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import UIKit
import Combine

import Core

import Then
import SnapKit

public final class ShoppingProductDetailVC: BaseViewController {
    //MARK: -- UI
    private let topNaviView: TopNavigationDefault = .init(transitionType: .pop("상품 상세보기"))
    
    private let singleLineView: UIView = .init().then {
        $0.backgroundColor = .systemGray5
    }
    
    private let productTitleLabel: UILabel = .init().then {
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 15, weight: .semibold)
        $0.tintColor = .label
    }
    
    //MARK: -- ViewModel
    private let viewModel: ShoppingProductDetailViewModel
    
    //MARK: -- init()
    public init(viewModel: ShoppingProductDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    //MARK: -- LifeCycle
    public override func loadView() {
        super.loadView()
        bind()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setView()
    }
}

extension ShoppingProductDetailVC {
    private func bind() {
        let input = ShoppingProductDetailViewModel.Input(
            viewDidLoad: self.viewDidLoadPublish.eraseToAnyPublisher(),
            backButtonTab: self.topNaviView.backButtonTapSubject.eraseToAnyPublisher())
        let output = self.viewModel.transform(input: input)
        
        output.pageTitle
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] title in
                self?.productTitleLabel.text = title
            })
            .store(in: &cancelBag)
        
        output.popCurrentVC
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            })
            .store(in: &cancelBag)
        
        output.errorMessage
            .sink(receiveValue: { [weak self] errorMessage in
                let alert = UIAlertController(title: "에러가 발생했습니다", 
                                              message: errorMessage,
                                              preferredStyle: .alert)
                self?.present(alert, animated: true)
            })
            .store(in: &cancelBag)
    }
}

//MARK: -- SetView
extension ShoppingProductDetailVC {
    private func setView() {
        self.view.addSubview(topNaviView)
        self.view.addSubview(singleLineView)
        self.view.addSubview(productTitleLabel)
        
        topNaviView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(20)
        }
        
        singleLineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(topNaviView.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        
        productTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(singleLineView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().offset(20)
        }
    }
}

