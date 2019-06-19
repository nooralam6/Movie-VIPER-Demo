//
//  MessageView.swift
//  MovieVIPERDemo
//
//  Created by new on 19/06/19.
//  Copyright © 2019 Sunday Mobility. All rights reserved.
//
import UIKit
import SwiftMessages

// This is wrapper class of Swift Messages
class SwiftMessage: NSObject {
    static let shared = SwiftMessage()
    var msg = SwiftMessages()
    
    private lazy var messageViewConfig: SwiftMessages.Config = {
        var config = SwiftMessages.defaultConfig
        config.interactiveHide = false
        config.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        config.duration = .seconds(seconds: 4)
        return config
    }()
    
    // Showing the alerts
    func showMesaage(of type: Theme, withTitle title: String,andMessage message: String) {
        let success = MessageView.viewFromNib(layout: .cardView)
        success.configureTheme(type)
        success.configureDropShadow()
        success.configureContent(title: title, body: message)
        success.button?.isHidden = true
        success.iconImageView?.isHidden = true
        var successConfig = SwiftMessages.defaultConfig
        successConfig.presentationStyle = .top
        successConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        msg.show(config: successConfig, view: success)
    }
    
    // Showing no internet connetion handling
    
    func showNoInternetMessage() {
        let success = MessageView.viewFromNib(layout: .cardView)
        success.configureTheme(.warning)
        success.configureDropShadow()
        success.configureContent(title: "Alert", body: Messages.noInternetMsg)
        success.button?.isHidden = true
        success.iconImageView?.isHidden = true
        var successConfig = SwiftMessages.defaultConfig
        successConfig.presentationStyle = .top
        successConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        msg.show(config: successConfig, view: success)
    }
    
    func showSomethingWentWrongMessage() {
        let success = MessageView.viewFromNib(layout: .cardView)
        success.configureTheme(.warning)
        success.configureDropShadow()
        success.configureContent(title: "", body: "Sorry, unable to connect to our servers. Please retry later.")
        success.button?.isHidden = true
        success.iconImageView?.isHidden = true
        var successConfig = SwiftMessages.defaultConfig
        successConfig.presentationStyle = .top
        successConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        msg.show(config: successConfig, view: success)
    }
    
    
    func showForgotPasswordPrompt(_ view: UIView?, height: CGFloat) {
        guard let view = view else {
            return
        }
        
        var config = self.messageViewConfig
        config.duration = .forever
        config.presentationStyle = .center
        config.dimMode = .color(color: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.8), interactive: false)
        let messageView = messageViewWithContentView(view, messageViewHeight: 210)
        SwiftMessages.show(config: config, view: messageView)
    }
    
    func showReadMoreContent(_ view: UIView?, height: CGFloat, style: SwiftMessages.PresentationStyle = .center) {
        guard let view = view else {
            return
        }
        
        var config = self.messageViewConfig
        config.duration = .forever
        config.presentationStyle = style
        config.dimMode = .color(color: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.8), interactive: true)
        let messageView = messageViewWithContentView(view, messageViewHeight: height)
        SwiftMessages.show(config: config, view: messageView)
    }
    
    func hideMessageView() {
        SwiftMessages.hide()
        msg.hideAll()
    }
    
    //MARK:- Open view as pop up
    private func messageViewWithContentView(_ contentView: UIView, messageViewHeight :CGFloat) -> MessageView {
        
        let messageView = MessageView(frame: .zero)
        //messageView.layoutMargins = .zero
        
        // view for the drop shadow.
        let backgroundView = UIView()
        // load drop view with insets
        messageView.installBackgroundView(backgroundView, insets: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
        
        // load view content
        messageView.installContentView(contentView, insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
        if (Device.IS_IPHONE_X) {
            let topOffset: CGFloat = 50.0
            messageView.backgroundHeight = messageViewHeight + topOffset
            messageView.safeAreaTopOffset = -topOffset
        } else {
            messageView.backgroundHeight = messageViewHeight
        }
        
        messageView.configureDropShadow()
        
        return messageView
    }
}
