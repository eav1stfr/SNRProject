import Foundation
import UIKit

final class LoginRegistrationLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = .black
        font = UIFont.systemFont(ofSize: 19, weight: .medium)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var labelText: String = "" {
        didSet {
            text = labelText
        }
    }
}
