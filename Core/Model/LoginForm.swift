//
//  LoginForm.swift
//  demo
//
//  Created by Andrey Bobkov on 06.07.17.
//  Copyright © 2017 White Tiger Soft. All rights reserved.
//

import UIKit

class LoginForm: BaseForm {
    static let minPasswordLength = 6
    
    var email: String!
    var password: String!
    
    override func validate()
    {
        super.validate()
        if (self.email.characters.count <= 0) {
            self.addError(errorString: "Введите email")
            return;
        }
        if (!self.email.isValidEmail()) {
            self.addError(errorString: "Введите корректный email")
            return;
        }
        if (self.password.characters.count <= 0) {
            self.addError(errorString: "Введите пароль")
            return;
        }
        if (self.password.characters.count <= LoginForm.minPasswordLength) {
            self.addError(errorString: String(format: "Минимальная длина пароля: %d символов", LoginForm.minPasswordLength))
            return;
        }
        if (!self.password.isValidPassword()) {
            self.addError(errorString: String(format: "Пароль должен содержать хотя бы 1 строчную букву, 1 заглавную и 1 цифру", LoginForm.minPasswordLength))
            return;
        }
    }
}
