//
//  ViewController.swift
//  RetryView
//
//  Created by rehantariq on 05/18/2021.
//  Copyright (c) 2021 rehantariq. All rights reserved.
//

import UIKit
import RetryView

class ViewController: UIViewController  {

    @IBOutlet weak var mainView : UIView!
    
    @IBAction func tapOnShowretryViewButton( sender: UIButton ){
        
        RetryView(parentView: mainView, message: "No internet connection", title: "Oops") {
            print("yourApiCall()")
               }.show()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//  RetryView.setAppearance(appearance: RetryViewAppearance(backgroundColor: .darkGray, messageTextColor: .red, buttonBackgroundColor: .red, buttonTextColor: .white, isRoundedButton: false))
        
    }

}

// For delegation
//
//extension ViewController: RetryViewDelegate{
//    func onRetry() {
//        print("yourApiCall()")
//    }
//
//    func showRetryview(){
//        RetryView(parentView: mainView, message: "No internet connection", delegate: self).show()
//    }
//}

