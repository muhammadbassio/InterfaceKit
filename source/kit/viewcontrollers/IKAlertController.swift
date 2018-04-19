//
//  InterfaceKit
//
//  Copyright © 2018 Muhammad Bassio. All rights reserved.
//

import UIKit

open class IKAlertController: UIViewController {
  
  private var dismissButton = UIButton(frame: .zero)
  @IBInspectable public var hidesByTouch:Bool = false { didSet { self.dismissButton.isUserInteractionEnabled = self.hidesByTouch } }
  @IBInspectable public var direction:Int = 0 {
    didSet {
      if let td = self.transitioningDelegate as? IKAlertTransitioningDelegate {
        guard let pd = PresentationDirection(rawValue: self.direction) else {
          return
        }
        td.direction = pd
      }
    }
  }
  
  override open func viewDidLoad() {
    super.viewDidLoad()
    self.dismissButton.addTarget(self, action: #selector(IKAlertController.dismissPressed), for: .touchDown)
    self.view.insertSubview(self.dismissButton, at: 0)
    self.dismissButton.isUserInteractionEnabled = self.hidesByTouch
    self.transitioningDelegate = IKAlertTransitioningDelegate()
    self.modalPresentationStyle = .custom
  }
  
  override open func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override open func viewWillLayoutSubviews() {
    self.dismissButton.frame = self.view.bounds
  }
  
  @objc func dismissPressed() {
    self.presentingViewController?.dismiss(animated: true, completion: nil)
  }
  
  @IBAction func dismiss() {
    self.dismissPressed()
  }
  
}
