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
        $0.collectionViewLayout = shoppingProductCellLayout
        $0.showsVerticalScrollIndicator = false
        $0.register(ShoppingProductItemCVC.self, forCellWithReuseIdentifier: ShoppingProductItemCVC.registerID)
        $0.prefetchDataSource = self
    }
    
    private lazy var shoppingProductCellLayout: UICollectionViewCompositionalLayout = {
       let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                             heightDimension: .estimated(245.5))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(281.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                     subitems: [item])
        group.interItemSpacing = .fixed(16)
        group.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 36
        section.contentInsets = .init(top: 20, leading: 0, bottom: 40, trailing: 0)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }()
    
    //MARK: ViewModel
    private let viewModel: ShoppingMainViewModel
    
    //MARK: -- Action
    private let prefetchRequestSubject: PassthroughSubject<[Int], Never> = .init()
    
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
        let input = ShoppingMainViewModel.Input(
            viewDidLoad: self.viewDidLoadPublish.eraseToAnyPublisher(),
            preFetchRequest: self.prefetchRequestSubject.eraseToAnyPublisher(),
            selectProduct: collectionView.didSelectItemPublisher
                .map(\.row)
                .eraseToAnyPublisher())
        let output = self.viewModel.transform(input: input)
        
        output.productList
            .bind(subscriber: collectionView.itemsSubscriber(cellIdentifier: ShoppingProductItemCVC.registerID,
                                                             cellType: ShoppingProductItemCVC.self,
                                                             cellConfig: { cellType, index, model in
                cellType.setData(data: model)
            }))
            .store(in: &cancelBag)
        
        output.showProductDetailVC
            .sink(receiveValue: { [weak self] model in
                print("selectModel \(model)")
            })
            .store(in: &cancelBag)
        
        output.errorMessage
            .sink(receiveValue: { [weak self] errorMessage in
                let alert = UIAlertController(title: "에러가 발생했습니다", message: errorMessage,
                                              preferredStyle: .alert)
                self?.present(alert, animated: true)
            })
            .store(in: &cancelBag)
    }
}

extension ShoppingMainVC: UICollectionViewDataSourcePrefetching {
    public func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        self.prefetchRequestSubject.send(indexPaths.map { $0.row })
    }
}

extension ShoppingMainVC {
    private func setView() {
        self.view.addSubview(topNaviView)
        self.view.addSubview(singleLineView)
        self.view.addSubview(collectionView)
        
        topNaviView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(20)
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
