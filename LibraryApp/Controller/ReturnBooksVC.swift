//
//  ReturnBooksVC.swift
//  LibraryApp
//
//  Created by cdp on 15/06/22.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class ReturnBooksVC: UIViewController {

    @IBOutlet weak var payfineBtn: UIButton!
    @IBOutlet weak var returnBtn: UIButton!
    @IBOutlet weak var returnDateLbl: UILabel!
    @IBOutlet weak var borrowDateLbl: UILabel!
    @IBOutlet weak var booknameLbl: UILabel!
  
    var dbref : DatabaseReference?
    var dbHandle : DatabaseHandle?
    var postData = [BorrowBookDetails]()
    
    var bookname = ""
    var borrowDate = ""
    var returnDate = ""
    
    override func viewWillAppear(_ animated: Bool) {
        
        booknameLbl.text = bookname
        borrowDateLbl.text = borrowDate
        returnDateLbl.text = returnDate
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let loggedInUser = Auth.auth().currentUser
//        if let user = loggedInUser{
//        
//            dbref = Database.database().reference().child("Users").child(user.uid).child("Borrowed books details")
//        }
//        
        booknameLbl.text = bookname
        borrowDateLbl.text = borrowDate
        returnDateLbl.text = returnDate
        // Do any additional setup after loading the view.
        payfineBtn.isEnabled = false
        
    }
    
   
    @IBAction func returnBtn(_ sender: Any) {
        
        
        
        let borrowDate = borrowDateLbl.text ?? ""
        let returnDate = returnDateLbl.text ?? ""
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        let borr = dateFormatter.date(from: borrowDate)
        let ret = dateFormatter.date(from: returnDate)
        let diffs = Calendar.current.dateComponents([.day], from: borr!, to: ret!)
        let days = diffs.day!
        print(days)
        
        if days > 7{
            
            showAlert(title: "Days Extended", msg: "You have to pay 100 Rs fine")
            returnBtn.isEnabled = false
            payfineBtn.isEnabled = true
            
        }
        
        booknameLbl.text = bookname
        DBUtility.instance.removeBook(bookname: bookname)
    
    }
    
    
    @IBAction func payfineBtn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "pay") as! PayFineVC
        vc.bookname = bookname
        show(vc, sender: self)
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
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
