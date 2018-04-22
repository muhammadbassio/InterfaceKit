//
//  InterfaceKit
//
//  Copyright © 2018 Muhammad Bassio. All rights reserved.
//

import UIKit

public extension UIView {
  
  @IBInspectable public var cornerRadius: CGFloat {
    set { self.layer.cornerRadius = newValue }
    get { return self.layer.cornerRadius }
  }
  
  @IBInspectable public var shadowColor:UIColor {
    get { return UIColor(cgColor: self.layer.shadowColor!) }
    set { self.layer.shadowColor = newValue.cgColor }
  }
  
  @IBInspectable public var shadowOffset:CGSize {
    get { return self.layer.shadowOffset }
    set { self.layer.shadowOffset = newValue }
  }
  
  @IBInspectable public var shadowOpacity:Float {
    get { return self.layer.shadowOpacity }
    set { self.layer.shadowOpacity = newValue }
  }
  
  @IBInspectable public var shadowRadius:CGFloat {
    get { return self.layer.shadowRadius }
    set { self.layer.shadowRadius = newValue }
  }
  
  @IBInspectable public var borderWidth:CGFloat {
    get { return self.layer.borderWidth }
    set { self.layer.borderWidth = newValue }
  }
  
  @IBInspectable public var borderColor:UIColor {
    get { return UIColor(cgColor: self.layer.borderColor!) }
    set { self.layer.borderColor = newValue.cgColor }
  }
  
  /// Returns constrains with specified identifier
  public func constraint(withIdentifier:String) -> NSLayoutConstraint? {
    return self.constraints.filter{ $0.identifier == withIdentifier }.first
  }
  
  /**
   Removes all constrains for this view
   */
  public func removeConstraints() {
    var list = [NSLayoutConstraint]()
    if let constraints = self.superview?.constraints {
      for c in constraints {
        if c.firstItem as? UIView == self || c.secondItem as? UIView == self {
          list.append(c)
        }
      }
    }
    self.superview?.removeConstraints(list)
    self.removeConstraints(self.constraints)
  }
  
  /**
   Returns a snapshot image of this view
   */
  public func snapshotImage(afterScreenUpdated: Bool = true) -> UIImage {
    let renderer = UIGraphicsImageRenderer(size: bounds.size)
    return renderer.image { _ in
      self.drawHierarchy(in: bounds, afterScreenUpdates: afterScreenUpdated)
    }
  }
}
