

import UIKit
import RxSwift
import RxCocoa

let requiredUserNameLength = 5
let requiredPasswordLength = 5

let limitUserNameLength = 20


let mainView = "homeView"
class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtEmail : UITextField!
    
    @IBOutlet weak var userNameValidationLabel: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var passwordInvalidLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    let disposeBag = DisposeBag()
    let viewModel = LoginViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.setTitleColor(.gray, for: .disabled)
        
        setupBindings()
    }
    
    func setupBindings(){
        txtEmail.rx.text.bind(to: viewModel.usernameSubject).disposed(by: disposeBag)
        txtPassword.rx.text.bind(to: viewModel.passwordSubject).disposed(by: disposeBag)
        
        viewModel.isValidUsername.bind(to: userNameValidationLabel.rx.isHidden).disposed(by: disposeBag)
        viewModel.isValidPassword.bind(to: passwordInvalidLabel.rx.isHidden).disposed(by: disposeBag)
        viewModel.isValidDataForm.bind(to: loginButton.rx.isEnabled).disposed(by: disposeBag)
    }
    
    @IBAction func btnLogin(_ sender:Any){
        // self.performSegue(withIdentifier: mainView, sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == mainView{
            let mainVC = segue.destination as! HomeViewController
            mainVC.userName = txtEmail.text!
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
