//
//  AddBookVC.swift
//  LibraryApp
//
//  Created by cdp on 11/06/22.
//

import UIKit

class AddBookVC: UIViewController {
    @IBOutlet weak var publicationDateTxt: UITextField!
    @IBOutlet weak var noOfBooksTxt: UITextField!
    @IBOutlet weak var authorTxt: UITextField!
    @IBOutlet weak var bookNameTxt: UITextField!
    @IBOutlet weak var bookIDTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addBtn(_ sender: Any) {
        
        let bookID = bookIDTxt.text ?? ""
        let bookName = bookNameTxt.text ?? ""
        let author = authorTxt.text ?? ""
        let publicationDate = publicationDateTxt.text ?? ""
        let noOfBooks = noOfBooksTxt.text ?? ""
        
        if bookID.isEmpty == false {
            if bookName.isEmpty == false {
                if author.isEmpty == false {
                    if publicationDate.isEmpty == false{
                        
                        DBUtility.instance.saveBooksDetails(bookID: bookID, bookName: bookName, numberOfBooks: noOfBooks, author: author, publicationDate: publicationDate)
                        let vc = storyboard?.instantiateViewController(withIdentifier: "booksearch") as! BookListVC
                        show(vc, sender: self)
                        
                    }
                }
            }
            
        }
        else{
            
            showAlert(title: "Invalid data", msg: "please enter all details")
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "booksearch") as! BookListVC
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

