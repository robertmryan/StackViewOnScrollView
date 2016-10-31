//
//  ContainerView.swift
//  StackViewOnScrollView
//
//  Created by Kévin MACHADO on 31/10/2016.
//  Copyright © 2016 Kévin MACHADO. All rights reserved.
//

import UIKit

class ContainerView<T:UIViewController>: UIView {
    
    unowned var parentViewController: UIViewController
    weak var currentController: T?
    
    init(parentController: UIViewController) {
        self.parentViewController = parentController
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func install(_ viewController: T) {
        pushViewController(viewController, animated: false)
    }
    
    func uninstall() {
        if let controller = currentController {
            removeViewController(controller)
            currentController = nil
        }
    }
    
    fileprivate func setUpViewController(_ targetViewController: T?, animated: Bool) {
        if let viewController = targetViewController {
            parentViewController.addChildViewController(viewController)
            viewController.view.frame = self.bounds
            self.addSubview(viewController.view)
            viewController.didMove(toParentViewController: parentViewController)
        }
    }
    
    fileprivate func removeViewController(_ viewController: T?) {
        if let _viewController = currentController {
            _viewController.willMove(toParentViewController: nil)
            _viewController.view.removeFromSuperview()
            _viewController.removeFromParentViewController()
        }
    }
    
    fileprivate func pushViewController(_ controller: T, animated: Bool) {
        removeViewController(currentController)
        currentController = controller
        setUpViewController(controller, animated: false)
    }
    
}
