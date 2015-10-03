//
//  ViewController.swift
//  ScrollToLoadMore_TextFieldMoveUP
//
//  Created by Benobab on 03/10/15.
//  Copyright © 2015 Benobab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var previousConstant:CGFloat = 0.0
    @IBOutlet weak var inputViewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func keyboardWillShow(notification : NSNotification) {
        
        var keyboardSize = notification.userInfo?[UIKeyboardFrameEndUserInfoKey]?.CGRectValue.size
        
        previousConstant = self.inputViewBottomConstraint.constant
        self.inputViewBottomConstraint.constant = keyboardSize!.height

        
        UIView.animateWithDuration(NSTimeInterval(0.2), delay: NSTimeInterval(0.2), options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            self.view.layoutIfNeeded()
            }) { (Bool) -> Void in
                
        }
        
        
        
    }
    
    func keyboardWillHide(notification : NSNotification) {
        
        self.inputViewBottomConstraint.constant = previousConstant
        self.view.layoutIfNeeded()
    }

}

