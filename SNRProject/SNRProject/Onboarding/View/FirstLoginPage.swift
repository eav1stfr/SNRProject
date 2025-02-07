import Foundation
import UIKit

final class LoginPage: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome Back!"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 29, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private let subheadingLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign in to continue your journey"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 19)
        label.textColor = .gray
        return label
    }()
    
    private var emailLabel: LoginRegistrationLabel = {
        let label = LoginRegistrationLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.labelText = "Email"
        return label
    }()
    
    private lazy var emailTextField: LoginRegistrationTextField = {
        let textField = LoginRegistrationTextField()
        textField.textFieldPlaceholder = "example@nu.edu.kz"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    
    private let passwordLabel: LoginRegistrationLabel = {
        let label = LoginRegistrationLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.labelText = "Password"
        return label
    }()
    
    private lazy var passwordTextField: LoginRegistrationTextField = {
        let textField = LoginRegistrationTextField()
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textFieldPlaceholder = "Your password"
        textField.isSecure = true
        return textField
    }()
    
    private func setupView() {
        self.backgroundColor = .white
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        addSubview(welcomeLabel)
        addSubview(subheadingLabel)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            //welcomeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            welcomeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            welcomeLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 200),
            
            subheadingLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 10),
            subheadingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            //subheadingLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: subheadingLabel.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20),
            emailTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            emailTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}

extension LoginPage: UITextFieldDelegate {
    
}

