//
//  SigninModel.swift
//  Assignment
//
//  Created by ankita khare on 23/09/21.
//

import Foundation

class SigninModel {
    var email: String = ""
    var password: String = ""
    convenience init(email: String, password: String) {
        self.init()
        self.email = email
        self.password = password
    }
}
