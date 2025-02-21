import Foundation
import UIKit

final class YellowButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var buttonText: String = "" {
        didSet {
            self.setTitle(buttonText, for: .normal)
        }
    }
    
    private func setupButton() {
        backgroundColor = UIColor(red: 235/255, green: 157/255, blue: 39/255, alpha: 1.0)
        layer.cornerRadius = 20
        isUserInteractionEnabled = true
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        heightAnchor.constraint(equalToConstant: 56).isActive = true
        widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32).isActive = true
    }
}
