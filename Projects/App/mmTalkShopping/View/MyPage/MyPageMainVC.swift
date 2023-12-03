//
//  MyPageMain.swift
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

public final class MyPageMainVC: BaseViewController {
    private let topNaviView: TopNavigationDefault = .init(transitionType: .title("내정보"))
    
    private let pageTitleLabel: UILabel = .init().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .systemGray2
        $0.text = "No Content"
    }
    
    //MARK: -- init()
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    //MARK: -- LifeCycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setView()
    }
}

//MARK: -- SetView
extension MyPageMainVC {
    private func setView() {
        self.view.addSubview(topNaviView)
        self.view.addSubview(pageTitleLabel)
        
        topNaviView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(20)
        }
        
        pageTitleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }
    }
}

