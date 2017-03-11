import UIKit

extension UIColor {
    
    public class var nickzillaYellow: UIColor {
        get {
            return color(from: "#ffb800")
        }
    }
    
    public class var nickzillaYellowTap: UIColor {
        get {
            return color(from: "#e3a50b")
        }
    }
    
    public class var nickzillaBlack: UIColor {
        get {
            return UIColor.nickzillaGray1
        }
    }
    
    public class var nickzillaGray1: UIColor {
        get {
            return color(from: "#212223")
        }
    }
    
    public class var nickzillaGray3: UIColor {
        get {
            return color(from: "#656565")
        }
    }
    
    public class var nickzillaMistGray: UIColor {
        get {
            return color(from: "#C8C9C7")
        }
    }
    
    public class var nickzillaOffWhite1: UIColor {
        get {
            return color(from: "#F5F5F5")
        }
    }
    
    public class var nickzillaOffWhite2: UIColor {
        get {
            return color(from: "#EEEEEE")
        }
    }
    
    public class var nickzillaOffWhite3: UIColor {
        get {
            return color(from: "#E9E9E9")
        }
    }
    
    static func color(from hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}
