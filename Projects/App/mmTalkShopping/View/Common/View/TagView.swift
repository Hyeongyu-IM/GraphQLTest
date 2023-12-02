//
//  TagView.swift
//  mmTalkShopping
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import UIKit

public final class TagView: UIButton {
    public var tagTitle: String {
        get { self.titleLabel?.text ?? "" }
        set { self.setTitle(newValue, for: .normal) }
    }
    
    public init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setAttribute() {
        self.isUserInteractionEnabled = false
        self.backgroundColor = .systemGray3
        self.layer.cornerRadius = 10
        self.setTitleColor(.darkGray, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 12)
    }
}
