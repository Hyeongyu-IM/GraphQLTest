//
//  ProductReviewStatusView.swift
//  mmTalkShopping
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import UIKit

///ProductReviewStatusView
///
/// - reviewScore: 현재 리뷰점수
public final class ProductReviewStatusView: UIView {
    //MARK: -- UI
    lazy var horizonStack: UIStackView = .init(arrangedSubviews: [
        starImageView,
        productScoreLabel,
        singleLineContainerView,
        reviewCountLabel
    ]).then {
        $0.spacing = 5
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
    }
        let starImageView: UIImageView = .init(image: .init(systemName: "star.fill")).then {
            $0.tintColor = .yellow
        }
        
        let productScoreLabel: UILabel = .init()
        
        let singleLineContainerView: UIView = .init()
        private let singleLineView: UIView = .init().then {
            $0.backgroundColor = .lightGray
        }
        
        let reviewCountLabel: UILabel = .init().then {
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .lightGray
        }
    
    private let maxScore: Int
    
    var reviewScore: Double = 0 {
        didSet {
            self.setProductScoreLabel(currentScore: reviewScore, maxScore: maxScore)
        }
    }
    
    var reviewCount: Int = 0 {
        didSet {
            self.reviewCountLabel.text = "리뷰 \(reviewCount)"
        }
    }
    
    public init(maxScore: Int) {
        self.maxScore = maxScore
        super.init(frame: .zero)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductReviewStatusView {
    private func setProductScoreLabel(currentScore: Double, maxScore: Int) {
        let mutableString: NSMutableAttributedString = .init()
        let font = UIFont.systemFont(ofSize: 12)
        
        let headAttribute: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.label,
                                                            .font: font]
        let currentScoreAtt = NSAttributedString(string: "\(currentScore)",
                                                 attributes: headAttribute)
        
        let tailAttribute: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.lightGray,
                                                            .font: font]
        let maxScoreAtt = NSAttributedString(string: "/\(maxScore)",
                                                 attributes: tailAttribute)
        mutableString.append(currentScoreAtt)
        mutableString.append(maxScoreAtt)
        productScoreLabel.attributedText = mutableString
    }
    
    private func setView() {
        singleLineContainerView.addSubview(singleLineView)
        
        singleLineView.snp.makeConstraints { make in
            make.width.equalTo(1)
            make.top.bottom.equalToSuperview().inset(3)
        }
    }
}
