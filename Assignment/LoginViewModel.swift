

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel {
  
  let usernameSubject = BehaviorRelay<String?>(value: "")
  let passwordSubject = BehaviorRelay<String?>(value: "")
  let disposeBag = DisposeBag()

  
  var isValidDataForm: Observable<Bool> {
    return Observable.combineLatest(usernameSubject, passwordSubject) {name, password
      in
      guard name != nil && password != nil else{
        return false
      }
      return name!.validateUsername() && password!.validatePassword()
    }
  }
  
  var isValidUsername: Observable<Bool> {
    return usernameSubject.map { $0!.validateUsername() }
  }
  
  var isValidPassword: Observable<Bool> {
    return passwordSubject.map { $0!.validatePassword() }
  }
  
    let invalidEmail                      = "Enter proper user name"
    let invalidPassword                   = "Password not meeting the criteria"
    let alertTitle                        = "Alert"
    
    
    func shakeTextField(_ txtField: UITextField) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.10
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = CGPoint(x:txtField.center.x - 7,y:txtField.center.y)
        animation.toValue = CGPoint(x:txtField.center.x + 7, y:txtField.center.y)
        txtField.layer.add(animation,forKey: "position")
    }
    
    
    
    func alertViewShow(message: String, vc: UIViewController) {
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Yes", style: .default, handler: { action in
        })
        alert.addAction(ok)
        vc.present(alert, animated: true)
    }
    
    
    
    func alertViewShowForPassword(message: String, vc: UIViewController) {
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Yes", style: .default, handler: { action in
        })
        alert.addAction(ok)
        vc.present(alert, animated: true)
    }
    
    
    
   /* func isValidateUserName(strUsername: String) -> Bool {
        let REGEX: String
        REGEX = "[A-Z0-9a-z.-].{2,10}" //"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", REGEX).evaluate(with: strUsername)
        
        
    }
    
    
    
    func isValidatePassword(strPassword: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{5,}")
        return passwordTest.evaluate(with: strPassword)
        
    }*/
    
    
    
}

extension String {
    func validateUsername() -> Bool {
        let usernameRegex = "[A-Z0-9a-z]{1,}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", usernameRegex)
        return predicate.evaluate(with: self)
    }
  
  func validatePassword() -> Bool {
//      let passwordRegex = "[A-Z0-9a-z@!?_]{5,}"
    let passwordRegex = "(?=^.{5,}$)(?=.*\\d)(?=.*[!@?_]+)(?=.*[A-Z])(?=.*[a-z]).*$"
      let predicate = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
      return predicate.evaluate(with: self)
  }
    
    
   /* func isValidateUserName(strUsername: String) -> Bool {
        let REGEX: String
        REGEX = "[A-Z0-9a-z.-].{2,10}" //"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", REGEX).evaluate(with: strUsername)
        
        
    }
    
    
    
    func isValidatePassword(strPassword: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{5,}")
        return passwordTest.evaluate(with: strPassword)
        
    }*/
    
}
