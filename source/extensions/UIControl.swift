//
//  InterfaceKit
//
//  Copyright © 2018 Muhammad Bassio. All rights reserved.
//

import UIKit

class ClosureContainer {
  let closure: ()->()
  init (_ closure: @escaping ()->()) { self.closure = closure }
  @objc func invoke () { closure() }
}

public extension UIControl {
  @discardableResult
  public func addClosure(for controlEvents: UIControlEvents, _ closure: @escaping ()->()) -> Self {
    let container = ClosureContainer(closure)
    self.addTarget(container, action: #selector(ClosureContainer.invoke), for: controlEvents)
    objc_setAssociatedObject(self, String(format: "[%d]", arc4random()), container, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    return self
  }
}
