//
//  UIStackView+Extension.swift
//  Core
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import UIKit

public extension UIStackView {
    func removeFully(view: UIView) {
        removeArrangedSubview(view)
        view.removeFromSuperview()
    }

    func removeFullyAllArrangedSubviews() {
        arrangedSubviews.forEach { view in
            removeFully(view: view)
        }
    }
}

