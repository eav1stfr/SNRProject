import Foundation
import UIKit

final class LoginRegistrationTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var textFieldPlaceholder: String = "" {
        didSet {
            self.placeholder = textFieldPlaceholder
        }
    }
    
    var isSecure: Bool = false {
        didSet {
            self.isSecureTextEntry = isSecure
        }
    }
    
    private func setupTextField() {
        backgroundColor = .white
        
        layer.cornerRadius = 30
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
        
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 60))
        rightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 60))
        leftViewMode = .always
        rightViewMode = .always
        autocorrectionType = .no
        autocapitalizationType = .none
        textColor = .black
        tintColor = .black
        heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
