//
//  BaseViewController.swift
//  demo
//
//  Created by Andrey Bobkov on 06.07.17.
//  Copyright © 2017 White Tiger Soft. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    @IBOutlet weak var constraintContainerBottom: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.onKeyboardToggle), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.onKeyboardToggle), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.endEditing(true)
    }
    
    func showAlert(title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func onKeyboardToggle(notification: Notification) {
        let keyboardInfo = notification.userInfo
        let duration = keyboardInfo?[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
        let keyboardFrameEndRect = keyboardInfo?[UIKeyboardFrameEndUserInfoKey] as! CGRect
        let isShowing = (notification.name == NSNotification.Name.UIKeyboardWillShow)
        
        UIView.animate(withDuration: duration) {
            if (isShowing) {
                self.onKeyboardWillShowWithSize(keyboardSize: keyboardFrameEndRect.size)
            } else {
                self.onKeyboardWillHide()
            }
            self.view.layoutIfNeeded()
        }
    }
    
    open func onKeyboardWillShowWithSize(keyboardSize: CGSize) {
        self.constraintContainerBottom?.constant = keyboardSize.height
    }
    
    open func onKeyboardWillHide() {
        self.constraintContainerBottom?.constant = 0
    }
}
