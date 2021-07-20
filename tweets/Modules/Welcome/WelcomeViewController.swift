//
//  WelcomeViewController.swift
//  tweets
//
//  Created by MacBook on 08/07/21.
//

import UIKit

class WelcomeViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        _setupUI()
    }
    
    private func _setupUI() -> Void {
        loginButton.layer.cornerRadius = 25
    }
}
