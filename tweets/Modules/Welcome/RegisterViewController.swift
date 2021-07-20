//
//  RegisterViewController.swift
//  tweets
//
//  Created by MacBook on 08/07/21.
//

import UIKit
import NotificationBannerSwift
import Simple_Networking
import SVProgressHUD

class RegisterViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var emailTextFiel: UITextField!
    @IBOutlet weak var passwordTextFiel: UITextField!
    @IBOutlet weak var namesTextFiel: UITextField!
    
    @IBOutlet weak var passwordRetryTextFiel: UITextField!
    
    // MARK: - IBActions
    @IBAction func registerButtonAction() {
        view.endEditing(true) // Cerrar el teclado
        _performRegister()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _setupUI()
    }
    

    // MARK: - Private Methods
    private func _setupUI() -> Void {
        registerButton.layer.cornerRadius = 25
    }
    private func _performRegister() {
        
        guard let names: String = namesTextFiel.text, !names.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Debes especificar un nombre de usuario.", style: .warning).show()
            return
        }
        
        guard let email: String = emailTextFiel.text, !email.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Debes especificar un correo.", style: .warning).show()
            return
        }
        
        guard let password: String = passwordTextFiel.text, !password.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Debes especificar una contraseña.", style: .warning).show()
            return
        }
        
        if (passwordRetryTextFiel.text!.isEmpty) {
            NotificationBanner(title: "Error", subtitle: "Debes repetir la contraseña.", style: .warning).show()
            return
        }
        
        if (password != passwordRetryTextFiel.text) {
            NotificationBanner(title: "Error", subtitle: "Las contraseñas son diferentes.", style: .warning).show()
            return
        }
        
        // Mostrar loader
        SVProgressHUD.show()
        
        let request = RegisterRequest(email: email, password: password, names: names)
        
        SN.post(endpoint: EndPoints.register, model: request) { (response: SNResultWithEntity<LoginResponse, ErrorResponse>) in
            // Cerrar Loader
            SVProgressHUD.dismiss()
            
            switch response {
                case .success(_):
                    self.performSegue(withIdentifier: "showHome", sender: nil)
                case .error(let error):
                    NotificationBanner(title: "Error",subtitle: error.localizedDescription, style: .danger).show()
                case .errorResult(let entity):
                    NotificationBanner(title: "Error",subtitle: entity.error, style: .danger).show()
            }
        }
        
    }
}
