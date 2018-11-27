//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

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
        let email: String = emailTextfield.text!
        let password: String = passwordTextfield.text!
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let user = authResult?.user{
                print(user.email! + "id logged in")
                self.performSegue(withIdentifier: "goToChat", sender: self)
                SVProgressHUD.dismiss()
            } else {
                print("error")
                
            }
        }
        
        //TODO: Set up a new user on our Firbase database
        
        

        
        
    } 
    
    
}
