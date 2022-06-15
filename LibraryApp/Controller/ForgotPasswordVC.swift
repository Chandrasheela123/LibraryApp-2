//
//  ForgotPasswordVC.swift
//  LibraryApp
//
//  Created by cdp on 13/06/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendLinkBtn(_ sender: Any) {
        
        let auth = Auth.auth()
        
        auth.sendPasswordReset(withEmail: emailTxt.text!) { (err) in
            if let error = err {
                
                self.showAlert(title: "Error", msg: error.localizedDescription)
                
            }
            
             self.showAlert(title: "Email sent", msg: "Check your email and click on link to reset password")
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
