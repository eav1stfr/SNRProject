import Foundation
import UIKit

protocol CreateAccountContentViewDelegate: AnyObject {
    func singUpPressed(name: String, email: String, password: String, confirmPassword: String)
    func signInPressed()
    func loginWithGooglePressed()
}

final class CreateAccountContentView: UIView {
    
    enum Constants {
        enum LabelsTexts {
            static let fullNameLabel = "Full name"
            static let emailLabel = "Email"
            static let passwordLabel = "Password"
            static let confirmPasswordLabel = "Confirm password"
            static let alreadyHaveAccountLabel = "Already have an account?"
            static let orLabel = "OR"
        }
        
        enum TextFieldPlaceholders {
            static let fullNamePlaceholder = "Your full name"
            static let emailPlaceholder = "name.surname@nu.edu.kz"
            static let passwordPlaceholder = "Your password"
        }
        
        enum ButtonsTexts {
            static let signUp = "SIGN UP"
            static let signIn = "Sign In"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var delegate: CreateAccountContentViewDelegate?
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.LabelsTexts.fullNameLabel
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private lazy var fullNameTextField: LoginRegistrationTextField = {
        let textField = LoginRegistrationTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textFieldPlaceholder = Constants.TextFieldPlaceholders.fullNamePlaceholder
        textField.delegate = self
        return textField
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.LabelsTexts.emailLabel
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private lazy var emailTextField: LoginRegistrationTextField = {
        let textField = LoginRegistrationTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textFieldPlaceholder = Constants.TextFieldPlaceholders.emailPlaceholder
        textField.delegate = self
        return textField
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.LabelsTexts.passwordLabel
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private lazy var passwordTextField: LoginRegistrationTextField = {
        let textField = LoginRegistrationTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textFieldPlaceholder = Constants.TextFieldPlaceholders.passwordPlaceholder
        textField.isSecure = true
        textField.delegate = self
        return textField
    }()
    
    private let confirmPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.LabelsTexts.confirmPasswordLabel
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private lazy var confirmPasswordTextField: LoginRegistrationTextField = {
        let textField = LoginRegistrationTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textFieldPlaceholder = Constants.TextFieldPlaceholders.passwordPlaceholder
        textField.isSecure = true
        return textField
    }()
    
    private lazy var signUpButton: YellowButton = {
        let button = YellowButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonText = Constants.ButtonsTexts.signUp
        button.addTarget(self, action: #selector(signUpPressed), for: .touchUpInside)
        return button
    }()
    
    private let orLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.LabelsTexts.orLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .gray
        return label
    }()
    
    private lazy var loginWithGoogleButton: GoogleLoginButton = {
        let button = GoogleLoginButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(googlePressed), for: .touchUpInside)
        return button
    }()
    
    private let dontHaveAccountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.LabelsTexts.alreadyHaveAccountLabel
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private lazy var signUpLabelButton: SignInUpLabelButton = {
        let button = SignInUpLabelButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        button.buttonText = Constants.ButtonsTexts.signIn
        return button
    }()
    
    private lazy var labelsStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.isUserInteractionEnabled = true
        stack.addArrangedSubview(dontHaveAccountLabel)
        stack.addArrangedSubview(signUpLabelButton)
        stack.distribution = .fillProportionally
        stack.spacing = 10
        return stack
    }()
    
    @objc
    private func signUpPressed() {
        print("Sign up pressed")
        delegate?.singUpPressed(name: "", email: "", password: "", confirmPassword: "")
    }
    
    @objc
    private func googlePressed() {
        print("google pressed")
        guard let fullName = fullNameTextField.text else {
            return
        }
        
        guard let email = emailTextField.text else {
            return
        }
        
        guard let password = passwordTextField.text else {
            return
        }
        
        guard let confirmPassword = confirmPasswordTextField.text else {
            return
        }
        
        delegate?.loginWithGooglePressed()
    }
    
    @objc
    private func signInButtonPressed() {
        print("sign in pressed")
        delegate?.signInPressed()
    }
    
    private func setupView() {
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        addSubview(fullNameLabel)
        addSubview(fullNameTextField)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(confirmPasswordLabel)
        addSubview(confirmPasswordTextField)
        addSubview(signUpButton)
        addSubview(orLabel)
        addSubview(loginWithGoogleButton)
        addSubview(labelsStack)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor),
            fullNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            fullNameTextField.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 15),
            fullNameTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            fullNameTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 15),
            emailTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            emailTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 15),
            passwordTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            confirmPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            confirmPasswordTextField.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 15),
            confirmPasswordTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            confirmPasswordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            signUpButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 25),
            signUpButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            orLabel.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 15),
            orLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            loginWithGoogleButton.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 15),
            loginWithGoogleButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            labelsStack.topAnchor.constraint(equalTo: loginWithGoogleButton.bottomAnchor, constant: 10),
            labelsStack.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}


extension CreateAccountContentView: UITextFieldDelegate {
    
}
