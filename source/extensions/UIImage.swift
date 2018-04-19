//
//  InterfaceKit
//
//  Copyright © 2018 Muhammad Bassio. All rights reserved.
//

import UIKit

public extension UIImage {
  
  /**
   Returns an image with the given color
   */
  static public func fromColor(_ color: UIColor) -> UIImage? {
    let rect = CGRect.init(x: 0, y: 0, width: 1, height: 1)
    UIGraphicsBeginImageContext(rect.size)
    guard let context = UIGraphicsGetCurrentContext() else { return nil }
    context.setFillColor(color.cgColor)
    context.fill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }
  
  /**
   Returns a scaled image of self with the given size
   */
  public func scaled(to size: CGSize) -> UIImage {
    assert(size.width > 0 && size.height > 0, "You cannot safely scale an image to a zero width or height")
    UIGraphicsBeginImageContextWithOptions(size, true, 0.0)
    draw(in: CGRect(origin: .zero, size: size))
    let scaledImage = UIGraphicsGetImageFromCurrentImageContext() ?? self
    UIGraphicsEndImageContext()
    return scaledImage
  }
  
  /**
   Returns a scaled image of self fitting the given size keeping the aspect ratio
   */
  public func aspectScaled(toFit size: CGSize) -> UIImage {
    assert(size.width > 0 && size.height > 0, "You cannot safely scale an image to a zero width or height")
    let imageAspectRatio = self.size.width / self.size.height
    let canvasAspectRatio = size.width / size.height
    var resizeFactor: CGFloat
    if imageAspectRatio > canvasAspectRatio {
      resizeFactor = size.width / self.size.width
    } else {
      resizeFactor = size.height / self.size.height
    }
    let scaledSize = CGSize(width: self.size.width * resizeFactor, height: self.size.height * resizeFactor)
    let origin = CGPoint(x: (size.width - scaledSize.width) / 2.0, y: (size.height - scaledSize.height) / 2.0)
    UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
    draw(in: CGRect(origin: origin, size: scaledSize))
    let scaledImage = UIGraphicsGetImageFromCurrentImageContext() ?? self
    UIGraphicsEndImageContext()
    return scaledImage
  }
  
  /**
   Returns a scaled image of self filling the given size keeping the aspect ratio
   */
  public func aspectScaled(toFill size: CGSize) -> UIImage {
    assert(size.width > 0 && size.height > 0, "You cannot safely scale an image to a zero width or height")
    let imageAspectRatio = self.size.width / self.size.height
    let canvasAspectRatio = size.width / size.height
    var resizeFactor: CGFloat
    if imageAspectRatio > canvasAspectRatio {
      resizeFactor = size.height / self.size.height
    } else {
      resizeFactor = size.width / self.size.width
    }
    let scaledSize = CGSize(width: self.size.width * resizeFactor, height: self.size.height * resizeFactor)
    let origin = CGPoint(x: (size.width - scaledSize.width) / 2.0, y: (size.height - scaledSize.height) / 2.0)
    UIGraphicsBeginImageContextWithOptions(size, true, 0.0)
    draw(in: CGRect(origin: origin, size: scaledSize))
    let scaledImage = UIGraphicsGetImageFromCurrentImageContext() ?? self
    UIGraphicsEndImageContext()
    return scaledImage
  }
}
