//
//  LoginViewController.swift
//  tweets
//
//  Created by MacBook on 08/07/21.
//

import UIKit
import NotificationBannerSwift
import Simple_Networking
import SVProgressHUD

class LoginViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextFiel: UITextField!
    @IBOutlet weak var passwordTextFiel: UITextField!
    
    // MARK: - IBActions
    @IBAction func loginButtonAction() {
        view.endEditing(true) // Cerrar el teclado
        _performLogin()
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()

        _setupUI()
    }
    
    // MARK: - Private Methods
    private func _setupUI() -> Void {
        loginButton.layer.cornerRadius = 25
    }
    
    private func _performLogin() {
        guard let email = emailTextFiel.text, !email.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Debes especificar un correo.", style: .warning).show()
            
            return
        }
        
        guard let password = passwordTextFiel.text, !password.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Debes especificar una contraseña.", style: .warning).show()
            
            return
        }
        
        // Mostrar loader
        SVProgressHUD.show()
        
        let request = LoginRequest(email: email, password: password)
        
        SN.post(endpoint: EndPoints.login, model: request) { (response: SNResultWithEntity<LoginResponse, ErrorResponse>) in
            // Cerrar Loader
            SVProgressHUD.dismiss()
            
            switch response {
                case .success(let user):
                    self.performSegue(withIdentifier: "showHome", sender: nil)
                case .error(let error):
                    NotificationBanner(title: "Error",subtitle: error.localizedDescription, style: .danger).show()
                case .errorResult(let entity):
                    NotificationBanner(title: "Error",subtitle: entity.error, style: .danger).show()
            }
        }
        
    }
}
