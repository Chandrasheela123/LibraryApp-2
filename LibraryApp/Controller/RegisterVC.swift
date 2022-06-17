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
    
    var isValidCredentials = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        fullNameTxt.delegate = self
        emailIdTxt.delegate = self
        mobileNoTxt.delegate = self
        cityTxt.delegate = self
        newPasswordTxt.delegate = self
        confirmPasswordTxt.delegate = self
    }
    
    
    @IBAction func signUpBtnClick(_ sender: Any) {
        
        let fullname = fullNameTxt.text ?? ""
        let password = newPasswordTxt.text ?? ""
        let confirmPassword = confirmPasswordTxt.text ?? ""
        let email = emailIdTxt.text ?? ""
        let city = cityTxt.text ?? ""
        let mobile = mobileNoTxt.text ?? ""
        
        Auth.auth().createUser(withEmail: email, password: password) { result, err in
            
            if err == nil {
                //                if self.isValidCredentials == true
                //                {
                
                print("No error in registration")
                self.showAlert(title: "Registeration successfull", msg: "Login using Email ID and Password")
                
                DBUtility.instance.saveUserDetails(fullname: fullname, email: email, city: city, mobile: mobile, password: password)
                
                //}
            }
            
            else {
                
                self.showAlert(title: "Registeration failed", msg: "ERROR : \(err!.localizedDescription)")
            }
            
        }
        
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "login") as! LoginVC
        show(vc, sender: self)
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "home") as! ViewController
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

extension RegisterVC : UITextFieldDelegate
{
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case fullNameTxt :
            mobileNoTxt.becomeFirstResponder()
        case mobileNoTxt:
            emailIdTxt.becomeFirstResponder()
        case emailIdTxt:
            cityTxt.becomeFirstResponder()
        case cityTxt:
            newPasswordTxt.becomeFirstResponder()
        case newPasswordTxt:
            confirmPasswordTxt.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let data = textField.text ?? ""
        
        switch textField {
        case fullNameTxt :
            isValidCredentials = validateFullName(fullname: data)
        case mobileNoTxt :
            isValidCredentials = validateMobile(mobile: data)
        case emailIdTxt:
            isValidCredentials = validateMobile(mobile: data)
        case newPasswordTxt:
            isValidCredentials = validateNewPassword(newpasswd: data)
        case confirmPasswordTxt :
            isValidCredentials = validateConfirmPasswords(cnfPass: data)
        default:
            break
        }
    }
    
    //Below functions are used to validate data of all fields in new register page
    
    //first name
    func validateFullName(fullname: String) -> Bool{
        if !fullname.isEmpty{
            return true
        }
        else {
            return false
        }
    }
    
    //mobile number
    func validateMobile(mobile: String) -> Bool{
        return mobile.count == 10 ? true : false
    }
    
    //new password
    func validateNewPassword(newpasswd: String) -> Bool {
        return newpasswd.count >= 8 ? true : false
        
    }
    
    //confirm password
    func validateConfirmPasswords(cnfPass: String) -> Bool {
        let firstPass = newPasswordTxt.text ?? ""
        
        return cnfPass == firstPass ? true : false
    }
}
