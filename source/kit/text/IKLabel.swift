//
//  InterfaceKit
//
//  Copyright © 2018 Muhammad Bassio. All rights reserved.
//

import UIKit

open class IKLabel: UILabel {
  
  @IBInspectable open var leftTextInset: CGFloat {
    set { textInsets.left = newValue }
    get { return textInsets.left }
  }
  
  @IBInspectable open var rightTextInset: CGFloat {
    set { textInsets.right = newValue }
    get { return textInsets.right }
  }
  
  @IBInspectable open var topTextInset: CGFloat {
    set { textInsets.top = newValue }
    get { return textInsets.top }
  }
  
  @IBInspectable open var bottomTextInset: CGFloat {
    set { textInsets.bottom = newValue }
    get { return textInsets.bottom }
  }
  
  public var textInsets = UIEdgeInsets.zero {
    didSet { invalidateIntrinsicContentSize() }
  }
  
  override open func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
    let insetRect = UIEdgeInsetsInsetRect(bounds, textInsets)
    let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
    let invertedInsets = UIEdgeInsets(top: -textInsets.top, left: -textInsets.left, bottom: -textInsets.bottom, right: -textInsets.right)
    return UIEdgeInsetsInsetRect(textRect, invertedInsets)
  }
  
  override open func drawText(in rect: CGRect) {
    super.drawText(in: UIEdgeInsetsInsetRect(rect, textInsets))
  }
  
}
