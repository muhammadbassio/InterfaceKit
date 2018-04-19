//
//  InterfaceKit
//
//  Copyright © 2018 Muhammad Bassio. All rights reserved.
//

import UIKit

public enum PresentationDirection: Int {
  case left = 0
  case top = 1
  case right = 2
  case bottom = 3
  case center = 4
}

public class IKAlertTransitioningDelegate: NSObject {
  // MARK: - Properties
  var direction = PresentationDirection.bottom
}

// MARK: - UIViewControllerTransitioningDelegate
extension IKAlertTransitioningDelegate: UIViewControllerTransitioningDelegate {
  
  public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
    let presentationController = IKAlertPresentationController(presentedViewController: presented, presenting: presenting, direction: direction)
    return presentationController
  }
  
  public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return IKAlertAnimator(direction: direction, isPresentation: true)
  }
  
  public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return IKAlertAnimator(direction: direction, isPresentation: false)
  }
}
