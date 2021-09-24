
import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var textHello:UITextField!
    var userName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textHello.textColor = UIColor.link
        self.textHello.isUserInteractionEnabled = false
        
        self.textHello.text = "Hello" + "  " + userName
    }
    
    
    
    @IBAction func btnBack(_ sender:Any){
        self.navigationController?.popViewController(animated: true)
    }
}
