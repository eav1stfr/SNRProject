import UIKit

protocol LoginRegistrationViewProtocolForPresenter: AnyObject {
    func changeToCreateAcc() {
        
    }
}

class ViewController: UIViewController {
    
    var presenter: LoginAndRegistrationPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupView()
    }
    
    private lazy var createAccView: CreateAccPage = {
        let view = CreateAccPage()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.isHidden = false
        view.mainContentView.delegate = self
        return view
    }()
    
    private lazy var loginView: LoginPage = {
        let view = LoginPage()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.isHidden = true
        view.delegate = self
        return view
    }()
    
    private func setupView() {
        addSubviews()
        setupContraints()
    }
    
    private func addSubviews() {
        view.addSubview(loginView)
        view.addSubview(createAccView)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.topAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            createAccView.topAnchor.constraint(equalTo: view.topAnchor),
            createAccView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            createAccView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            createAccView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: LoginPageDelegate {
    func signInWithGooglePressed() {
        
    }
    
    func singUpPressed() {
        
    }
    
    func signInPressed(email: String?, password: String?) {
        guard let safeEmail = email else {
            return
        }
        
        guard let safePassword = password else {
            return
        }
        
        if safeEmail == "" {
            let alert = UIAlertController(title: "Empty field", message: "Email is missing", preferredStyle: .alert)
            let action = UIAlertAction(title: "Go back", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true)
            return
        }
        
        if safePassword == "" {
            let alert = UIAlertController(title: "Empty field", message: "Password is missing", preferredStyle: .alert)
            let action = UIAlertAction(title: "Go back", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true)
            return
        }
        
        presenter?.signInPressed(email: safeEmail, password: safePassword)
    }
}

extension ViewController: LoginRegistrationViewProtocolForPresenter {
    
}

extension ViewController: CreateAccountContentViewDelegate {
    func singUpPressed(name: String, email: String, password: String, confirmPassword: String) {
        
    }
    
    func signInPressed() {
        
    }
    
    func loginWithGooglePressed() {
        
    }
}
