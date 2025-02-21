import Foundation
import UIKit

final class SubheadingLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.font = UIFont.systemFont(ofSize: 14)
        self.textColor = .gray
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
