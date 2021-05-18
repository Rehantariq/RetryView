//
//  MSRetryViewAppearance.swift
//  MSRetryView
//
//  Created by RehanTariq on 17/05/2021.
//  Copyright © 2021 RehanTariq. All rights reserved.
//

import UIKit

public class RetryViewAppearance {
    
   var backgroundColor: UIColor!
   var messageTextColor: UIColor!
    
   var buttonBackgroundColor: UIColor!
   var buttonTextColor: UIColor!
 
   var isRoundedButton: Bool!
    
   private init(){}
   public init(   backgroundColor:UIColor = .white,
                 messageTextColor:UIColor = .black,
            buttonBackgroundColor:UIColor = .lightGray,
                  buttonTextColor:UIColor = .black,
                  isRoundedButton:Bool = true
    ){
        self.backgroundColor = backgroundColor
        self.messageTextColor = messageTextColor
        self.buttonBackgroundColor = buttonBackgroundColor
        self.buttonTextColor = buttonTextColor
        self.isRoundedButton = isRoundedButton
    }
}
