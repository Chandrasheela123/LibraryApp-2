//
//  IssueLibraryCardVC.swift
//  LibraryApp
//
//  Created by cdp on 14/06/22.
//

import UIKit

class IssueLibraryCardVC: UIViewController {

    @IBOutlet weak var statusTxt: UITextField!
    @IBOutlet weak var cardNumTxt: UITextField!
    @IBOutlet weak var nameTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func issueBtn(_ sender: Any) {
        
        let cardNumber = Int(cardNumTxt.text ?? "") ?? 0
        let status = statusTxt.text ?? ""
        let name = nameTxt.text ?? ""
        
        if !status.isEmpty{
        
        DBUtility.instance.saveCardDetails(name: name, cardNumber: cardNumber, status: status)
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
    
    @IBAction func backBtn(_ sender: Any) {
    }
    
}
