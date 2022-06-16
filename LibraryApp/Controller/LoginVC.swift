//
//  LoginVC.swift
//  LibraryApp
//
//  Created by cdp on 11/06/22.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {

    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var emailIDTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "register") as! RegisterVC
        self.show(vc, sender: nil)
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        
        let uname = emailIDTxt.text ?? ""
        let password = passwordTxt.text ?? ""
        
        Auth.auth().signIn(withEmail: uname, password: password) { result, err in
            if err == nil{
                
                if self.emailIDTxt.text == "admin@gmail.com" && self.passwordTxt.text == "admin123" {
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "admin") as! WelcomeAdminVC
                    self.show(vc, sender: nil)
                    
                }
                else {
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "member") as! WelcomeLibraryMembersVC
                    self.show(vc, sender: nil)
                }
            }
            else {
                self.showAlert(title: "Login failed..", msg: err!.localizedDescription)
            }
        }
    }
    
    @IBAction func forgotPasswordBtn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "forgotpassword") as! ForgotPasswordVC
        show(vc, sender: self)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
