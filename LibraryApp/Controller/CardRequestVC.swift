//
//  CardRequestVC.swift
//  LibraryApp
//
//  Created by cdp on 14/06/22.
//

import UIKit
import FirebaseDatabase

class CardRequestVC: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var nameTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func requestBtn(_ sender: Any) {
        
        let fullname = nameTxt.text ?? ""
        let email = emailTxt.text ?? ""
        
        DBUtility.instance.saveCardRequestDetails(fullname: fullname, email: email)
        
        showAlert(title: "Request Sucessfully", msg: "Your request has been sent to admin")
            
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
