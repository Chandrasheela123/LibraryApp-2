//
//  PayFineVC.swift
//  LibraryApp
//
//  Created by cdp on 15/06/22.
//

import UIKit

class PayFineVC: UIViewController {

    @IBOutlet weak var amountTxt: UITextField!
    @IBOutlet weak var booknameLbl: UILabel!
    
    var bookname = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        booknameLbl.text = bookname
    }
    
    @IBAction func cancelBtn(_ sender: Any) {


        let vc = storyboard?.instantiateViewController(withIdentifier: "borrowed") as! BorrowedBooksVC
        show(vc, sender: self)
    }
    
    @IBAction func payFineBtn(_ sender: Any) {
        
        let amount = amountTxt.text ?? ""
        
        if amount.isEmpty == false{
        
        showAlert(title: "Amount", msg: "Paid Sucessfully")
            
        }
        else
        {
            showAlert(title: "Amount", msg: "Please enter amount")
        }
        
        booknameLbl.text = bookname
        DBUtility.instance.removeBook(bookname: bookname)
        
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
