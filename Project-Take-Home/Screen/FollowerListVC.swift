//
//  FollowerListVC.swift
//  Project-Take-Home
//
//  Created by Ray Dolber on 8/25/22.
//

import UIKit

class FollowerListVC: UIViewController {

    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor                                    = .systemPink
        navigationController?.isNavigationBarHidden             = false
        navigationController?.navigationBar.prefersLargeTitles  = true
    }
}
