import Foundation
import UIKit

final class HaveAccountLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var labelText: String = "" {
        didSet {
            self.text = labelText
        }
    }
    
    private func setupLabel() {
        self.font = UIFont.systemFont(ofSize: 16)
        self.textColor = .black
    }
}
