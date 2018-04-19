//
//  InterfaceKit
//
//  Copyright © 2018 Muhammad Bassio. All rights reserved.
//

import UIKit

public class IKAlertPresentationController: UIPresentationController {
  
  // MARK: - Properties
  fileprivate var dimmingView: UIView!
  private var direction: PresentationDirection
  
  override public var frameOfPresentedViewInContainerView: CGRect {
    var frame: CGRect = .zero
    frame.size = size(forChildContentContainer: presentedViewController, withParentContainerSize: containerView!.bounds.size)
    return frame
  }
  
  // MARK: - Initializers
  init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?, direction: PresentationDirection) {
    self.direction = direction
    super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    self.setupDimmingView()
  }
  
  override public func presentationTransitionWillBegin() {
    containerView?.insertSubview(dimmingView, at: 0)
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[dimmingView]|", options: [], metrics: nil, views: ["dimmingView": self.dimmingView]))
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[dimmingView]|", options: [], metrics: nil, views: ["dimmingView": self.dimmingView]))
    
    guard let coordinator = presentedViewController.transitionCoordinator else {
      self.dimmingView.alpha = 1.0
      return
    }
    
    coordinator.animate(alongsideTransition: { _ in
      self.dimmingView.alpha = 1.0
    })
  }
  
  override public func dismissalTransitionWillBegin() {
    guard let coordinator = presentedViewController.transitionCoordinator else {
      self.dimmingView.alpha = 0.0
      return
    }
    
    coordinator.animate(alongsideTransition: { _ in
      self.dimmingView.alpha = 0.0
    })
  }
  
  override public func containerViewWillLayoutSubviews() {
    self.presentedView?.frame = self.frameOfPresentedViewInContainerView
  }
  
  override public func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
    return parentSize
  }
}

// MARK: - Private
private extension IKAlertPresentationController {
  
  func setupDimmingView() {
    self.dimmingView = UIView()
    self.dimmingView.translatesAutoresizingMaskIntoConstraints = false
    self.dimmingView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    self.dimmingView.alpha = 0.0
  }
}
