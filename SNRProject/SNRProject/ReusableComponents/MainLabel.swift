import Foundation
import UIKit

final class MainLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        self.textColor = .black
    }
    
    var labelText: String = "" {
        didSet {
            self.text = labelText
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
