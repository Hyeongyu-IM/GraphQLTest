//
//  ShoppingProductItemCVC.swift
//  mmTalkShopping
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import UIKit

import Core
import Domain

import Kingfisher
import Then
import SnapKit

public final class ShoppingProductItemCVC: UICollectionViewCell {
    static let registerID: String = "\(ShoppingProductItemCVC.self)"
    
    //MARK: - UI
    private let productImageView: UIImageView = .init().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
        $0.contentMode = .scaleAspectFill
    }
    
    private lazy var verticalStackView: UIStackView = .init(arrangedSubviews: [
        brandNameLabel,
        productNameLabel,
        subContentStackView,
        reviewScoreAndCountLabel,
        tagHorizonStackView
    ]).then {
        $0.axis = .vertical
        $0.spacing = 5
        $0.distribution = .equalSpacing
    }
    
    private let brandNameLabel: UILabel = .init().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .systemGray3
    }
    
    private let productNameLabel: UILabel = .init().then {
        $0.font = .systemFont(ofSize: 15)
        $0.numberOfLines = 2
        $0.lineBreakMode = .byTruncatingTail
    }
    
    private lazy var subContentStackView: UIStackView = .init(arrangedSubviews: [
        discountLabel,
        priceLabel
    ]).then {
        $0.spacing = 10
        $0.axis = .horizontal
        $0.distribution = .fill
    }
        private let discountLabel: UILabel = .init().then {
            $0.font = .boldSystemFont(ofSize: 20)
            $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        }
        private let priceLabel: UILabel = .init().then {
            $0.font = .boldSystemFont(ofSize: 20)
            $0.setContentHuggingPriority(.defaultLow, for: .horizontal)
        }
    
    private let reviewScoreAndCountLabel: ProductReviewStatusView = .init(maxScore: 5).then {
        $0.isHidden = true
    }
    
    private let tagHorizonStackView: UIStackView = .init().then {
        $0.axis = .horizontal
        $0.spacing = 10
        $0.distribution = .equalSpacing
        $0.isHidden = true
    }
    
    private var downloadTask: DownloadTask?
    
    //MARK: - init()
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        downloadTask?.cancel()
        tagHorizonStackView.removeFullyAllArrangedSubviews()
    }
    
    func setData(data: ProductModel) {
        brandNameLabel.text = data.brand
        productNameLabel.text = data.name
        discountLabel.text = "\(data.discountRate)%"
        priceLabel.text = Int(data.sellPrc).withComma
        reviewScoreAndCountLabel.isHidden = data.reviewCount == 0
        reviewScoreAndCountLabel.reviewScore = data.reviewAvg
        reviewScoreAndCountLabel.reviewCount = data.reviewCount
        tagHorizonStackView.isHidden = data.tagList.isEmpty
        if data.tagList.isEmpty == false {
            data.tagList.forEach { tag in
                let tagView = TagView()
                tagView.tagTitle = tag.title
                tagHorizonStackView.addArrangedSubview(tagView)
            }
        }
    }
}

extension ShoppingProductItemCVC {
    private func setView() {
        self.contentView.addSubview(productImageView)
        self.contentView.addSubview(verticalStackView)
        
        productImageView.snp.makeConstraints { make in
            make.height.equalTo(productImageView.snp.width)
            make.top.horizontalEdges.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
