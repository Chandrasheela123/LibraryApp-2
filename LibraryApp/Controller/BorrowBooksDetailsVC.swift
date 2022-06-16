//
//  BorrowBooksDetailsVC.swift
//  LibraryApp
//
//  Created by cdp on 15/06/22.
//

import UIKit

class BorrowBooksDetailsVC: UIViewController {

    @IBOutlet weak var returnDatePicker: UIDatePicker!
    @IBOutlet weak var borrowDatePicker: UIDatePicker!
    @IBOutlet weak var returnDateLbl: UILabel!
    @IBOutlet weak var borrowDateLbl: UILabel!
    @IBOutlet weak var booknameLbl: UILabel!
    
    var borrowDateSelected : Date = Date()
    var returnDateSelected : Date = Date()
    
    var bookname = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        booknameLbl.text = bookname
        borrowDatePicker.locale = .current
        borrowDatePicker.date = Date()
        returnDatePicker.date = Date()
        //datePicker.preferredDatePickerStyle = .compact
    }
    
    @IBAction func returnDatePickerSelect(_ sender: Any) {
        returnDateSelected = returnDatePicker.date
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "dd/MM/yyyy"
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
       
        returnDateLbl.text = dateFormatter1.string(from: returnDateSelected)
    }
    @IBAction func borrowDatePickerSelect(_ sender: Any) {
        
        borrowDateSelected = borrowDatePicker.date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        borrowDateLbl.text = dateFormatter.string(from: borrowDateSelected)
    }
    
    @IBAction func borrowBtn(_ sender: Any) {
        
        let bookname = booknameLbl.text ?? ""
        let borrowDate = borrowDateLbl.text ?? ""
        let returnDate = returnDateLbl.text ?? ""
        
        showAlert(title: "\(bookname) book borrowed sucessfully", msg: "If return date is more than 7 days you need to pay fine of 100 Rs")
        DBUtility.instance.saveBorrowedBooksDetails(bookname: bookname, borrowDate: borrowDate, returnDate: returnDate)
        
        
        
        
    
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "usersearch") as! SearchBookVC
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
