//
//  LoginViewController.swift
//  AutoLayoutTask3
//
//  Created by Даниил Сивожелезов on 31.05.2024.
//

import UIKit
import AuthenticationServices

class LoginViewController: UIViewController {

    // MARK: - GUI Variables
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var registerStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.text = "Instagram"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "E-mail"
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(configuration: .borderedProminent())
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgotten password?", for: .normal)
//        button.backgroundColor = .none
//        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var appleLoginButton: ASAuthorizationAppleIDButton = {
        let button = ASAuthorizationAppleIDButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var registerLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account?"
        return label
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign up", for: .normal)
        return button
    }()
    
    // MARK: - Properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
    }
    
    // MARK: - Methods
    private func setupUI() {
        stackView.addArrangedSubviews([logoLabel,
                                       emailTextField,
                                       passwordTextField,
                                       loginButton,
                                       forgotPasswordButton])
        registerStackView.addArrangedSubviews([registerLabel, registerButton])
        view.addSubviews([stackView, appleLoginButton, registerStackView])
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        appleLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        appleLoginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20).isActive = true
        
        registerStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        registerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerStackView.widthAnchor.constraint(lessThanOrEqualTo: stackView.widthAnchor, multiplier: 1).isActive = true
    }
}

