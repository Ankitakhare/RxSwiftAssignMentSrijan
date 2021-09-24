//
//  SigninViewModel.swift
//  Assignment
//
//  Created by ankita khare on 23/09/21.
//

import Foundation
import RxSwift
import RxCocoa

class VSSigninViewModel  {
    
    let model: SigninModel
    private let disposeBag = DisposeBag()
    
    let emailFieldViewModel = VSEmailViewModel()
    let passwordFieldViewModel = VSPasswordViewModel()
    
    // RX
    let isLoading = Variable(false)
    var isSuccess = Variable(false)
    var errorMessage = Variable<String?>(nil)
    
    init(model: SigninModel) {
        self.model = model
    }
    
    func validForm() -> Bool {
        return emailFieldViewModel.validate() && passwordFieldViewModel.validate()
    }
    
    func signin() {
        // update model
        model.email     = emailFieldViewModel.value.value
        model.password  = passwordFieldViewModel.value.value
        
        // launch request
        let request = Request(email: model.email, password: model.password)
        VSService.execute(request)
            .`do`(onSubscribe: { [weak self] in
                self?.isLoading.value = true
            })
            .subscribe(onNext: { [weak self] response in
                self?.isLoading.value = false
                self?.isSuccess.value = true
                }, onError: { [weak self] error in
                    self?.isLoading.value = false
                    self?.errorMessage.value = error.message
                    self?.isSuccess.value = false
            }).disposed(by: disposeBag)
    }
}
