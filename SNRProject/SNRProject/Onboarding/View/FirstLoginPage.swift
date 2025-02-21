import UIKit

protocol LoginPageDelegate: AnyObject {
    func signInPressed(email: String?, password: String?)
    func signInWithGooglePressed()
    func singUpPressed()
}

final class LoginPage: UIView {
    
    weak var delegate: LoginPageDelegate?
    
    enum Constants {
        enum Texts {
            static let welcomeText = "Welcome Back!"
            static let subheadingLabel = "Sign in to continue your journey"
            static let dontHaveAccLabel = "Don't have an account?"
            static let emailLabel = "Email"
            static let passwordLabel = "Password"
            static let signInButtonLabel = "SIGN IN"
            static let orLabel = "OR"
            static let signUpButtonLabel = "Sign Up"
        }
        
        enum Placeholders {
            static let emailPlaceholder = "example@nu.edu.kz"
            static let passwordPlaceholder = "Your password"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private let welcomeLabel: MainLabel = {
        let label = MainLabel()
        label.labelText = Constants.Texts.welcomeText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subheadingLabel: SubheadingLabel = {
        let label = SubheadingLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.labelText = Constants.Texts.subheadingLabel
        return label
    }()
    
    private let orLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Texts.orLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    private var emailLabel: LoginRegistrationLabel = {
        let label = LoginRegistrationLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.labelText = Constants.Texts.emailLabel
        return label
    }()
    
    private lazy var emailTextField: LoginRegistrationTextField = {
        let textField = LoginRegistrationTextField()
        textField.textFieldPlaceholder = Constants.Placeholders.emailPlaceholder
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    
    private let passwordLabel: LoginRegistrationLabel = {
        let label = LoginRegistrationLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.labelText = Constants.Texts.passwordLabel
        return label
    }()
    
    private lazy var passwordTextField: LoginRegistrationTextField = {
        let textField = LoginRegistrationTextField()
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textFieldPlaceholder = Constants.Placeholders.passwordPlaceholder
        textField.isSecure = true
        return textField
    }()
    

    private lazy var signInButton: YellowButton = {
        let button = YellowButton()
        button.buttonText = Constants.Texts.signInButtonLabel
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var loginWithGoogleButton: GoogleLoginButton = {
        let button = GoogleLoginButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(signInWithGooglePressed), for: .touchUpInside)
        return button
    }()
    
    private let dontHaveAccountLabel: HaveAccountLabel = {
        let label = HaveAccountLabel()
        label.labelText = Constants.Texts.dontHaveAccLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var signUpLabelButton: SignInUpLabelButton = {
        let button = SignInUpLabelButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        button.buttonText = Constants.Texts.signUpButtonLabel
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
        addSubview(signInButton)
        addSubview(orLabel)
        addSubview(loginWithGoogleButton)
        addSubview(labelsStack)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            welcomeLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 130),
            
            subheadingLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 10),
            subheadingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            emailLabel.topAnchor.constraint(equalTo: subheadingLabel.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 15),
            emailTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            emailTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 15),
            passwordTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            signInButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25),
            
            orLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 15),
            orLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            loginWithGoogleButton.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 15),
            loginWithGoogleButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            labelsStack.topAnchor.constraint(equalTo: loginWithGoogleButton.bottomAnchor, constant: 10),
            labelsStack.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    @objc
    private func signInButtonPressed(_ sender: UIButton) {
        delegate?.signInPressed(email: emailTextField.text, password: passwordTextField.text)

    }
    
    @objc
    private func signInWithGooglePressed() {
        delegate?.signInWithGooglePressed()
    }
    
    @objc
    private func signUpButtonPressed() {
        print("yo")
        delegate?.singUpPressed()
    }
}

extension LoginPage: UITextFieldDelegate {
    
}
