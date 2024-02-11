//
//  ViewController+add.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import AppKit

extension NSViewController {

    func add(viewController: NSViewController, to containingView: NSView) {
        
        if viewController.parent != nil {
            viewController.view.viewWillMove(toSuperview: self.view)
            viewController.removeFromParent()
        }
        
        containingView.addSubview(viewController.view)

        addChild(viewController)
        viewController.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|",
                                                                   options: .directionLeadingToTrailing,
                                                                   metrics: nil,
                                                                   views: ["view": viewController.view as Any]))

        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|",
                                                                   options: .directionLeadingToTrailing,
                                                                   metrics: nil,
                                                                   views: ["view": viewController.view as Any]))
        viewController.view.viewDidMoveToSuperview()
    }
}
