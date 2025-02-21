import Foundation
import UIKit

final class CreateAccPage: UIView {
    
    enum Constants {
        enum Texts {
            static let mainLabel = "Create an Account"
            static let subheadingLabel = "Sign up to start your journey"
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.alwaysBounceVertical = true
        view.isScrollEnabled = true
        return view
    }()
    
    private let createAccountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .black
        label.text = Constants.Texts.mainLabel
        return label
    }()
    
    private let subheadingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.Texts.subheadingLabel
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    var mainContentView: CreateAccountContentView = {
        let view = CreateAccountContentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupView() {
        self.backgroundColor = .white
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        self.addSubview(createAccountLabel)
        self.addSubview(subheadingLabel)
        self.addSubview(scrollView)
        
        scrollView.addSubview(mainContentView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            createAccountLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            createAccountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            subheadingLabel.topAnchor.constraint(equalTo: createAccountLabel.bottomAnchor, constant: 10),
            subheadingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            scrollView.topAnchor.constraint(equalTo: subheadingLabel.bottomAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            mainContentView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height - 200),
            mainContentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainContentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            mainContentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            mainContentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            mainContentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
    }
}

extension CreateAccPage: CreateAccountContentViewDelegate {
    func singUpPressed(name: String, email: String, password: String, confirmPassword: String) {
         
    }
    
    func singUpPressed() {
        
    }
    
    func signInPressed() {
        
    }
    
    func loginWithGooglePressed() {
        
    }
}
