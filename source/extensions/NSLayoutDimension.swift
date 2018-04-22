//
//  InterfaceKit
//
//  Copyright © 2018 Muhammad Bassio. All rights reserved.
//

import UIKit

public extension NSLayoutDimension {
  
  public func constraint(equalToConstant c: CGFloat, withIdentifier identifier:String) -> NSLayoutConstraint {
    let constraint = self.constraint(equalToConstant: c)
    constraint.identifier = identifier
    return constraint
  }
  
}
