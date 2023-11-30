//
//  ViewController.swift
//  mmTalkShopping
//
//  Created by 임현규 on 11/28/23.
//

import UIKit

import Core
import Domain
import Networks

class ViewController: UIViewController {
    private let network = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        network.fetchProductList()
    }


}

