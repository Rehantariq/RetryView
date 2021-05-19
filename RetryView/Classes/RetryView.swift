//
//  MSRetryView.swift
//  MSRetryView
//
//  Created by RehanTariq on 17/05/2021.
//  Copyright © 2021 RehanTariq. All rights reserved.
//

import Foundation
import UIKit

public protocol RetryViewDelegate {
    func onRetry()
}

public class RetryView: UIView {
   public static let REMOVE_RETRY_VIEW_OBSERVER = "REMOVE_RETRY_VIEW"
               var onRetry: (() -> Void)?
   fileprivate var parentView: UIView!
   fileprivate var message: String!
   fileprivate var title: String!
   fileprivate var buttonTitle: String = "Retry"
   fileprivate var delegate: RetryViewDelegate!
        static var appearance: RetryViewAppearance = RetryViewAppearance()
    
   override private init(frame: CGRect){
        super.init(frame: frame)
        isUserInteractionEnabled = true
        layer.masksToBounds = true
        backgroundColor = RetryView.appearance.backgroundColor
    }
    
    @discardableResult
    public convenience init(parentView: UIView, message: String , title: String = "",  buttonTitle: String = ""  , onRetry: @escaping (() -> Void)  ) {
        self.init(frame: parentView.bounds)
        self.bounds = parentView.bounds
        self.parentView = parentView
        self.onRetry = onRetry
        self.message = message
        self.title = title
        if buttonTitle != "" {
            self.buttonTitle = buttonTitle
        }
    }
    
    @discardableResult
    public convenience init(parentView: UIView, message: String  , title: String = "" , buttonTitle: String = "" , delegate: RetryViewDelegate  ) {
        self.init(frame: parentView.bounds)
        self.bounds = parentView.bounds
        self.parentView = parentView
        self.delegate = delegate
        self.message = message
        self.title = title
        if buttonTitle != "" {
           self.buttonTitle = buttonTitle
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func show(){
         NotificationCenter.default.addObserver(self, selector: #selector(self.removeMe), name: NSNotification.Name(rawValue: RetryView.REMOVE_RETRY_VIEW_OBSERVER) , object: nil)
        parentView.addSubview(self)
        
                let button = UIButton()
                    button.backgroundColor = RetryView.appearance.buttonBackgroundColor
                    button.setTitleColor(RetryView.appearance.buttonTextColor, for: .normal)
                    button.setTitle(buttonTitle, for: .normal)
        
                    button.addTarget(self, action: #selector(tapOnRetryButton), for: .touchUpInside)
                    self.addSubview(button)
         
                    button.translatesAutoresizingMaskIntoConstraints = false
                    button.centerYAnchor.constraint(equalTo: self.centerYAnchor,constant: 50).isActive = true
                    button.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
                    button.widthAnchor.constraint(equalToConstant: 150).isActive = true
                    button.heightAnchor.constraint(equalToConstant: 40).isActive = true
                    if RetryView.appearance.isRoundedButton {
                    button.layer.cornerRadius = 10
                    button.layer.masksToBounds = true
                    }
                               
                 let messageLabel = UILabel()
                    messageLabel.text = message
                    messageLabel.numberOfLines = 10
                    messageLabel.textAlignment = .center
                    messageLabel.font = UIFont.systemFont(ofSize: 16)
                    messageLabel.textColor = RetryView.appearance.messageTextColor
                    self.addSubview(messageLabel)
                    messageLabel.translatesAutoresizingMaskIntoConstraints = false
                    messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
                    messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
                    messageLabel.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -20).isActive = true
        
                 let titleLabel = UILabel()
                           titleLabel.text = title
                           titleLabel.numberOfLines = 5
                           titleLabel.textAlignment = .center
                           titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
                           titleLabel.textColor = RetryView.appearance.messageTextColor
                           self.addSubview(titleLabel)
                           titleLabel.translatesAutoresizingMaskIntoConstraints = false
                           titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
                           titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
                           titleLabel.bottomAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -10).isActive = true
                
    }
     
    @objc func tapOnRetryButton(sender: UIButton){
        NotificationCenter.default.removeObserver(self)
        removeFromSuperview()
        if delegate != nil {
            delegate.onRetry()
        }else
            if onRetry != nil {
             onRetry!()
        }
    }
    
    @objc func removeMe( ){
        NotificationCenter.default.removeObserver(self)
        removeFromSuperview()
    }
    
    public class func setAppearance(appearance:RetryViewAppearance){
        RetryView.appearance = appearance
    }
       
}




