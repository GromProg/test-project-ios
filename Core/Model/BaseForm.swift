//
//  BaseForm.swift
//  demo
//
//  Created by Andrey Bobkov on 06.07.17.
//  Copyright © 2017 White Tiger Soft. All rights reserved.
//

import UIKit

class BaseForm: NSObject {
    var errors: [String]!
    
    open func validate() {
        self.errors = []
    }
    
    func firstError() -> String {
        if (!hasErrors()) {
            return "";
        }
        return self.errors.first!;
    }
    
    func hasErrors() -> Bool {
        return (self.errors.count > 0);
    }
    
    func addError(errorString: String) {
        self.errors.append(errorString)
    }
}
