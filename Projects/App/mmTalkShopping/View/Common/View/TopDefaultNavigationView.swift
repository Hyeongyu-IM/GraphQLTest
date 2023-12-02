//
//  TopDefaultNavigationView.swift
//  mmTalkShopping
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import UIKit
import Combine

import CombineCocoa

///TopNavigationDefault
///
/// - ViewTransitionType:
/// title, pop 두가지 형태
public final class TopNavigationDefault: UIView {
    public enum ViewTransitionType {
        case title(String)
        case pop(String)
        
        var image: UIImage? {
            switch self {
            case .title: return nil
            case .pop: return .init(systemName: "chevron.backward")
            }
        }
        
        var text: String {
            switch self {
            case .title(let title): return title
            case .pop(let title): return title
            }
        }
    }
    
    //MARK: -- UI
    private let backButtonImageView: UIImageView = .init()
    private let backButton: UIButton = .init().then {
        $0.tintColor = .black
    }
    
    private let titleLabel: UILabel = .init().then {
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textAlignment = .left
    }
    
    private var cancellable: Set<AnyCancellable> = .init()
    
    //MARK: - Public Property
    public var type: ViewTransitionType {
        didSet {
            titleLabel.text = type.text
            backButtonImageView.image = type.image
        }
    }
    
    public var naviTitle: String {
        get { self.titleLabel.text ?? "" }
        set { self.titleLabel.text = newValue }
    }
    
    public lazy var backButtonTapSubject: PassthroughSubject<Void, Never> = .init()
    
    //MARK: - init()
    public init(transitionType: ViewTransitionType) {
        self.type = transitionType
        super.init(frame: .zero)
        setView()
        setAttribute()
        bind()
    }
    
    @available(*,unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.height = 56
        return size
    }
}


extension TopNavigationDefault {
    private func setAttribute() {
        self.titleLabel.text = type.text
        self.backButtonImageView.image = type.image
    }
    
    private func bind() {
        self.backButton.tapPublisher
            .sink(receiveValue: { [weak self] in
                self?.backButtonTapSubject.send(Void())
            })
            .store(in: &cancellable)
    }
}

extension TopNavigationDefault {
    private func setView() {
        self.addSubview(backButton)
        self.addSubview(titleLabel)
        
        backButton.addSubview(backButtonImageView)
        
        backButton.snp.makeConstraints {
            $0.height.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.3)
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        backButtonImageView.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.leading.equalToSuperview().offset(12)
            $0.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(48)
        }
    }
}

