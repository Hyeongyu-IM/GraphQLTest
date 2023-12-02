//
//  ShoppingMainViewController.swift
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
import CombineDataSources

public final class ShoppingMainVC: BaseViewController {
    //MARK: UI
    private let topNaviView: TopNavigationDefault = .init(transitionType: .title("쇼핑몰"))
    
    private let singleLineView: UIView = .init().then {
        $0.backgroundColor = .systemGray5
    }
    
    private lazy var collectionView: UICollectionView = .init(frame: .zero,
                                                              collectionViewLayout: .init()).then {
        $0.register(ShoppingProductItemCVC.self, forCellWithReuseIdentifier: ShoppingProductItemCVC.registerID)
    }
    
    //MARK: ViewModel
    private let viewModel: ShoppingMainViewModel
    
    //MARK: init()
    public init(viewModel: ShoppingMainViewModel) {
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

extension ShoppingMainVC {
    private func bind() {
        let input = ShoppingMainViewModel.Input(viewDidLoad: self.viewDidLoadPublish.eraseToAnyPublisher())
        let output = self.viewModel.transform(input: input)
        
        output.productList
            .bind(subscriber: collectionView.itemsSubscriber(cellIdentifier: ShoppingProductItemCVC.registerID,
                                                             cellType: ShoppingProductItemCVC.self,
                                                             cellConfig: { cellType, index, model in
                cellType.setData(data: model)
            }))
            .store(in: &cancelBag)
        
        output.errorMessage
            .sink(receiveValue: { [weak self] errorMessage in
                let alert = UIAlertController(title: "에러가 발생했습니다", message: errorMessage,
                                              preferredStyle: .alert)
                self?.present(alert, animated: true)
            })
            .store(in: &cancelBag)
    }
    
    private func setView() {
        self.view.addSubview(topNaviView)
        self.view.addSubview(singleLineView)
        self.view.addSubview(collectionView)
        
        topNaviView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        singleLineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(topNaviView.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(singleLineView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
