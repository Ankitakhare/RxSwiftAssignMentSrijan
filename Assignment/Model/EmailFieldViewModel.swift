//
//  SigninViewModel.swift
//  Assignment
//
//  Created by ankita khare on 23/09/21.
//

import Foundation
import  RxSwift
import RxCocoa

struct VSEmailViewModel : VSFieldViewModel {
    
    var value: Variable<String> = Variable("")
    var errorValue: Variable<String?> = Variable(nil)
    
    let title = "Email"
    let errorMessage = "Email is wrong"
    
    func validate() -> Bool {
        let emailPattern = "[A-Z0-9a-z._%+-]+@([A-Za-z0-9.-]{2,64})+\\.[A-Za-z]{2,64}"
        guard validateString(value.value, pattern:emailPattern) else {
            errorValue.value = errorMessage
            return false
        }
        errorValue.value = nil
        return true
    }
}
