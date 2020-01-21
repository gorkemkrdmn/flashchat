//
//  RegisterViewController.swift
//  Flash Chat
//
//  View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {

    
  
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        
        SVProgressHUD.show()
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (authResult, error) in
            if error != nil {
				
				SVProgressHUD.dismiss()
				
				let alert = UIAlertController(title: "Registration is not succesful", message: "Please try a different email adress and also your password must contain at least 6 characters!", preferredStyle: .alert)
				alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
				self.present(alert, animated: true)
            }
            else {
                SVProgressHUD.dismiss() 
                print("Registration succesful")
                
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
        
    }
    
}
