import UIKit

protocol NickzillaButtonColors {
    var disabledBackgroundColor: UIColor { get }
    var disabledBorderColor: UIColor { get }
    var highlightBackgroundColor: UIColor { get }
    var highlightBorderColor: UIColor { get }
    var normalBackgroundColor: UIColor { get }
    var normalBorderColor: UIColor { get }
}

open class NickzillaButton: UIButton {
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel?.font = UIFont.systemFont(ofSize: 15.0, weight: UIFontWeightBold)
    }
    
    override open func setTitle(_ title: String?, for state: UIControlState) {
        super.setTitle(title?.uppercased(), for: state)
    }
}

@IBDesignable open class NickzillaPrimaryButton: NickzillaButton {
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createBackgroundImages(with: frame)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createBackgroundImages(with: frame)
    }

    open override func prepareForInterfaceBuilder() {
        backgroundColor = normalBackgroundColor
    }    
    
    func createBackgroundImages(with frame: CGRect) {
        setBackgroundImage(buttonBackgroundImage(
            backgroundColor: normalBackgroundColor,
            borderColor: normalBorderColor,
            size: frame.size),
                           for: .normal)
        setBackgroundImage(buttonBackgroundImage(
            backgroundColor: disabledBackgroundColor,
            borderColor: disabledBorderColor,
            size: frame.size),
                           for: .disabled)
        setBackgroundImage(buttonBackgroundImage(
            backgroundColor: highlightBackgroundColor,
            borderColor: highlightBorderColor,
            size: frame.size),
                           for: .highlighted)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        setTitleColor(normalTitleColor, for: .normal)
        setTitleColor(disabledTitleColor, for: .disabled)
        setTitleColor(highlightTitleColor, for: .highlighted)
        setTitle(titleLabel?.text, for: [])
    }
}

extension NickzillaPrimaryButton: NickzillaButtonColors {
    var disabledBackgroundColor:    UIColor { get { return UIColor.nickzillaOffWhite3 } }
    var disabledBorderColor:        UIColor { get { return UIColor.nickzillaOffWhite3 } }
    var disabledTitleColor:         UIColor { get { return UIColor.nickzillaMistGray } }
    var highlightBackgroundColor:   UIColor { get { return UIColor.nickzillaYellowTap } }
    var highlightBorderColor:       UIColor { get { return UIColor.nickzillaYellowTap } }
    var highlightTitleColor:        UIColor { get { return UIColor.white } }
    var normalBackgroundColor:      UIColor { get { return UIColor.nickzillaYellow } }
    var normalBorderColor:          UIColor { get { return UIColor.nickzillaYellow } }
    var normalTitleColor:           UIColor { get { return UIColor.white } }
}

@IBDesignable open class NickzillaSecondaryButton: NickzillaButton {
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createBackgroundImages(with: frame)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createBackgroundImages(with: frame)
    }
    
    open override func prepareForInterfaceBuilder() {
        layer.borderWidth = 2.0
        layer.borderColor = normalBorderColor.cgColor
    }
    
    func createBackgroundImages(with frame: CGRect) {
        setBackgroundImage(buttonBackgroundImage(
            backgroundColor: normalBackgroundColor,
            borderColor: normalBorderColor,
            size: frame.size),
                           for: .normal)
        setBackgroundImage(buttonBackgroundImage(
            backgroundColor: disabledBackgroundColor,
            borderColor: disabledBorderColor,
            size: frame.size),
                           for: .disabled)
        setBackgroundImage(buttonBackgroundImage(
            backgroundColor: highlightBackgroundColor,
            borderColor: highlightBorderColor,
            size: frame.size),
                           for: .highlighted)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        setTitleColor(normalTitleColor, for: .normal)
        setTitleColor(disabledTitleColor, for: .disabled)
        setTitleColor(highlightTitleColor, for: .highlighted)
        setTitle(titleLabel?.text, for: [])
    }
}

extension NickzillaSecondaryButton: NickzillaButtonColors {
    var disabledBackgroundColor:    UIColor { get { return UIColor.clear } }
    var disabledBorderColor:        UIColor { get { return UIColor.nickzillaOffWhite3 } }
    var disabledTitleColor:         UIColor { get { return UIColor.nickzillaMistGray } }
    var highlightBackgroundColor:   UIColor { get { return UIColor.nickzillaOffWhite2 } }
    var highlightBorderColor:       UIColor { get { return UIColor.nickzillaYellow } }
    var highlightTitleColor:        UIColor { get { return UIColor.nickzillaYellow } }
    var normalBackgroundColor:      UIColor { get { return UIColor.white } }
    var normalBorderColor:          UIColor { get { return UIColor.nickzillaYellow } }
    var normalTitleColor:           UIColor { get { return UIColor.nickzillaYellow } }
}

func buttonBackgroundImage(backgroundColor: UIColor, borderColor: UIColor, size: CGSize) -> UIImage {
    let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    
    backgroundColor.setFill()
    UIRectFill(rect)
    
    borderColor.setStroke()
    let path = UIBezierPath(rect: rect)
    path.lineWidth = 8.0 / UIScreen.main.scale
    path.stroke()
    
    var image = UIImage()
    if let context = UIGraphicsGetImageFromCurrentImageContext() {
        image = context
    }
    UIGraphicsEndImageContext()
    return image
}

