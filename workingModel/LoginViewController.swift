//
//  LoginViewController.swift
//  ThriveUp
//
//  Created by palak seth on 15/11/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - UI Elements
    private let segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["User", "Host"])
        control.selectedSegmentIndex = 0
        control.backgroundColor = UIColor.systemOrange.withAlphaComponent(0.1)
        control.selectedSegmentTintColor = .white
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle.fill")
        imageView.tintColor = .systemOrange
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let loginTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "User Login"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let loginSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter with your SRM credentials"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userIDTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "User ID"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .systemOrange
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var isUserSelected = true // Track whether "User" or "Host" is selected
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        setupActions()
    }
    
    // MARK: - Setup Methods
    private func setupViews() {
        view.addSubview(segmentedControl)
        view.addSubview(profileImageView)
        view.addSubview(loginTitleLabel)
        view.addSubview(loginSubtitleLabel)
        view.addSubview(userIDTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.widthAnchor.constraint(equalToConstant: 200),
            
            profileImageView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 32),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            
            loginTitleLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            loginTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginSubtitleLabel.topAnchor.constraint(equalTo: loginTitleLabel.bottomAnchor, constant: 8),
            loginSubtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            userIDTextField.topAnchor.constraint(equalTo: loginSubtitleLabel.bottomAnchor, constant: 32),
            userIDTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            userIDTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            passwordTextField.topAnchor.constraint(equalTo: userIDTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 32),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupActions() {
        // Add action targets with `self` as the target instance
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc private func segmentChanged() {
        isUserSelected = segmentedControl.selectedSegmentIndex == 0
        updateLoginPrompt()
    }
    
    private func updateLoginPrompt() {
        loginTitleLabel.text = isUserSelected ? "User Login" : "Host Login"
    }
    
    @objc private func handleLogin() {
        let credentials = LoginCredentials(
            userID: userIDTextField.text ?? "",
            password: passwordTextField.text ?? "",
            isUser: isUserSelected
        )
        
        // Handle login action here, such as validating credentials or navigating to another screen
        print("Login attempted with credentials: \(credentials)")
    }
}

