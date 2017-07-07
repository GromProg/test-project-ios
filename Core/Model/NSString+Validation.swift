//
//  NSString+Validation.swift
//  demo
//
//  Created by Andrey Bobkov on 06.07.17.
//  Copyright © 2017 White Tiger Soft. All rights reserved.
//

import Foundation

extension NSString {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}" //Simple validation
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        let emailRegEx = "^(?=.*[A-ZА-Я])(?=.*[0-9])(?=.*[a-zа-я]).{3,}$" //Simple validation
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
