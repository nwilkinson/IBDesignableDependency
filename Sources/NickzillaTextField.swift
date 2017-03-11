import UIKit

@IBDesignable open class nickzillaTextField: UITextField {
    
    var label = UILabel()
    @IBInspectable var titleText: String? {
        didSet {
            layoutSubviews()
        }
    }
    
    let padding = UIEdgeInsetsMake(8.0, 8.0, 8.0, 8.0)
    
    override open func layoutSubviews() {
        
        borderStyle = .none
        layer.backgroundColor = UIColor.white.cgColor
        layer.borderColor = UIColor.nickzillaMistGray.cgColor
        layer.borderWidth = 2.0/UIScreen.main.scale
        layer.cornerRadius = 2.0
        
        var frame = self.frame
        frame.size.height = 20.0
        frame = frame.offsetBy(dx: 3.0, dy: -24.0)
        label.frame = frame
        label.font = UIFont.systemFont(ofSize: 16.0, weight: UIFontWeightRegular)
        label.textColor = UIColor.nickzillaBlack
        label.text = titleText
        superview?.addSubview(label)
        font = UIFont.systemFont(ofSize: 22.0, weight: UIFontWeightRegular)
        textColor = UIColor.nickzillaBlack
        
        if let placeholderText = placeholder {
            let placeholderAttributes = [
                NSForegroundColorAttributeName: UIColor.nickzillaMistGray,
                NSFontAttributeName: UIFont.systemFont(ofSize: 22.0, weight: UIFontWeightRegular)
            ]
            self.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: placeholderAttributes)
        }
        
        super.layoutSubviews()
        
    }
    
    open override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    open override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    open override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
}
