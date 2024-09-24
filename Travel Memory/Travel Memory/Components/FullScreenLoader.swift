//
//  FullScreenLoader.swift
//  Travel Memory
//
//  Created by Irakli Kochua on 23.09.24.
//

import Foundation
import UIKit

class FullScreenLoader {
    private static var containerView: UIView?
    
    static func show(in viewController: UIViewController) {
        guard containerView == nil else { return }
        
        let containerView = UIView(frame: viewController.view.bounds)
        containerView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .white
        activityIndicator.center = containerView.center
        activityIndicator.startAnimating()
        
        containerView.addSubview(activityIndicator)
        viewController.view.addSubview(containerView)
        
        self.containerView = containerView
    }
    
    static func hide() {
        containerView?.removeFromSuperview()
        containerView = nil
    }
}
