import Foundation
import UIKit

final class SignInUpLabelButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var buttonText: String = "" {
        didSet {
            setTitle(buttonText, for: .normal)
        }
    }
    
    private func setupButton() {
        backgroundColor = .white
        isUserInteractionEnabled = true
        titleLabel?.font = UIFont.systemFont(ofSize: 16)
        setTitleColor(UIColor(red: 235/255, green: 157/255, blue: 39/255, alpha: 1.0), for: .normal)
    }
}
