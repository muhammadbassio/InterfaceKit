//
//  InterfaceKit
//
//  Copyright © 2018 Muhammad Bassio. All rights reserved.
//

import UIKit

@IBDesignable
open class IKTextField: UITextField {
  
  @IBInspectable open var padding:CGFloat = 10
  
  override open func textRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(x: bounds.origin.x + self.padding, y: bounds.origin.y, width: (bounds.width - (2 * self.padding)), height: bounds.height)
  }
  
  override open func editingRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(x: bounds.origin.x + self.padding, y: bounds.origin.y, width: (bounds.width - (2 * self.padding)), height: bounds.height)
  }
}
