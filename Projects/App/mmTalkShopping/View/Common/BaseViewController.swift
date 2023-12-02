//
//  BaseViewController.swift
//  mmTalkShopping
//
//  Created by 임현규 on 12/2/23.
//  Copyright © 2023 com.hyeongyu. All rights reserved.
//

import UIKit
import Combine

import Core

open class BaseViewController: UIViewController {
    
    // MARK: - Properties
    public var cancelBag: Set<AnyCancellable> = .init()
    
    // MARK: - LifeCycle
    public let viewDidLoadPublish: PassthroughSubject<Void, Never> = .init()
    public let viewWillAppearPublish: PassthroughSubject<Void, Never> = .init()
    public let viewIsAppearingPublish: PassthroughSubject<Void, Never> = .init()
    public let viewDidAppearPublish: PassthroughSubject<Void, Never> = .init()
    public let viewWillDisappearPublish: PassthroughSubject<Void, Never> = .init()
    public let viewDidDisappearPublish: PassthroughSubject<Void, Never> = .init()
    
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.viewDidLoadPublish.send(Void())
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewWillAppearPublish.send(Void())
    }
    
    open override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        self.viewIsAppearingPublish.send(Void())
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewDidAppearPublish.send(Void())
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.viewWillDisappearPublish.send(Void())
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.viewDidDisappearPublish.send(Void())
    }
    
    
    //MARK: - initializers
    deinit {
        print("deinit - \(theClassName)")
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .white
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
