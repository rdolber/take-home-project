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
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.prefersLargeTitles  = true
        
//        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, errorMessage in
//            guard let followers = followers else {
//                self.presentGFAlertOnMainThread(title: "Bad Stuff Happened", message: errorMessage!.rawValue, buttonTitle: "OK")
//                return
//            }
//
//            print("followers.count : ", followers.count)
//            print(followers)
//        }
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            switch result {
            case .success(let followers):
                print("followers.count : ", followers.count)
                print(followers)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happened", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
