import Foundation
import UIKit

final class GoogleLoginButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        
        setTitle("Login with Google", for: .normal)
        
        backgroundColor = .white
        layer.cornerRadius = 20
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1.0
        
        setTitleColor(.black, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32).isActive = true
        heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
}
