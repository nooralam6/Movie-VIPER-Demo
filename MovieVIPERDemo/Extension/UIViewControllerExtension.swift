//
//  UIViewControllerExtension.swift
//  MovieVIPERDemo
//
//  Created by new on 19/06/19.
//  Copyright © 2019 Sunday Mobility. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

extension UIViewController: NVActivityIndicatorViewable {
    func showLoader () {
        let activityData = ActivityData(size: nil, message: nil, messageFont: nil, messageSpacing: nil, type: .ballDoubleBounce, color: nil, padding: nil, displayTimeThreshold: nil, minimumDisplayTime: nil, backgroundColor: nil, textColor: nil)
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
    }
    
    func removeLoader() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
    }
    
    func addEmptyView(action: @escaping()->()) {
        let view = UIView(frame: self.view.frame)
        view.backgroundColor = .blue
        view.tag = 980
        self.view.addSubview(view)
    }
    
    func removeEmptyView() {
        if let view = self.view.viewWithTag(980) {
            view.removeFromSuperview()
        }
    }
}
