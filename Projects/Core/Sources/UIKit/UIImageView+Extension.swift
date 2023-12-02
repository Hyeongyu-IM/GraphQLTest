//
//  UIImage+Extension.swift
//  Core
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import UIKit

import Kingfisher

public extension UIImageView {
    @discardableResult
    func setImage(with urlString: String) -> DownloadTask? {
        guard let encodedStr = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: encodedStr) else { return nil }
        let resource = KF.ImageResource(downloadURL: url, cacheKey: urlString)
        return self.kf.setImage(with: resource, options: [.cacheMemoryOnly, .transition(.fade(0.3))])
    }
}
