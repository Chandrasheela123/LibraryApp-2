//
//  RegisterVC.swift
//  LibraryApp
//
//  Created by cdp on 11/06/22.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class RegisterVC: UIViewController {

    @IBOutlet weak var confirmPasswordTxt: UITextField!
    @IBOutlet weak var newPasswordTxt: UITextField!
    @IBOutlet weak var mobileNoTxt: UITextField!
    @IBOutlet weak var cityTxt: UITextField!
    @IBOutlet weak var emailIdTxt: UITextField!
    @IBOutlet weak var fullNameTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var loginBtn: UILabel!
    @IBAction func registerBtn(_ sender: Any) {
        
        let fullname = fullNameTxt.text ?? ""
        let password = newPasswordTxt.text ?? ""
        let confirmPassword = confirmPasswordTxt.text ?? ""
        let email = emailIdTxt.text ?? ""
        let city = cityTxt.text ?? ""
        let mobile = mobileNoTxt.text ?? ""
        
        Auth.auth().createUser(withEmail: email, password: password) { result, err in
            
            if err == nil {
                
                print("No error in registration")
                self.showAlert(title: "Registeration successfull", msg: "Login using Email ID and Password")
                
                DBUtility.instance.saveUserDetails(fullname: fullname, email: email, city: city, mobile: mobile)
                
            }
            else {
                
                self.showAlert(title: "Registeration failed", msg: "ERROR : \(err!.localizedDescription)")
            }
          
            }
            
        }
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
