//
//  BorrowedBooksVC.swift
//  LibraryApp
//
//  Created by cdp on 14/06/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class BorrowedBooksVC: UIViewController {

    @IBOutlet weak var tbl: UITableView!
    
    var dbref : DatabaseReference?
    var dbHandle : DatabaseHandle?
    var postData = [BorrowBookDetails]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tbl.delegate = self
        tbl.dataSource = self
        
        // Do any additional setup after loading the view.
        
        let loggedInUser = Auth.auth().currentUser
        if let user = loggedInUser{
        
            dbref = Database.database().reference().child("Users").child(user.uid).child("Borrowed books details")
        
        dbref!.observe(DataEventType.value, with: {(DataSnapshot) in
            
            if DataSnapshot.childrenCount > 0 {
                
                print("has children")
                
                for users in DataSnapshot.children.allObjects as![DataSnapshot]{
                    
                    let userObject = users.value as? [String: AnyObject]
                    
                    let bookName = userObject?["bookname"]
                    let borrowDate = userObject?["borrowDate"]
                    let returnDate = userObject?["returnDate"]
                    
                    let book = BorrowBookDetails(bookname: bookName as? String, borrowDate: borrowDate as? String, returnDate: returnDate as? String)
                    
                    print("books")
                    self.postData.append(book)
                    print("appended")
                    
                    
                }
                self.tbl.reloadData()
                
            }
        })
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
extension BorrowedBooksVC : UITableViewDataSource, UISearchBarDelegate
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tbl.dequeueReusableCell(withIdentifier: "borrowtabelcell", for: indexPath) as! BorrowBooksCell
        
        let book : BorrowBookDetails
        book = postData[indexPath.row]
        cell.layer.cornerRadius = 10
        cell.booknameLbl.text = book.bookname
        cell.borrowDateLbl.text = book.borrowDate
        cell.returnDateLbl.text = book.returnDate
       
        
        return cell
    }
  }


extension BorrowedBooksVC : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
        

        let alert = UIAlertController(title: "Return", message: "Want to return book?", preferredStyle: .alert)
        let update = UIAlertAction(title: "Yes", style: .default){ _ in
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "return") as! ReturnBooksVC
            vc.bookname = self.postData[indexPath.row].bookname ?? ""
            vc.borrowDate = self.postData[indexPath.row].borrowDate ?? ""
            vc.returnDate = self.postData[indexPath.row].returnDate ?? ""
            
            self.show(vc, sender: self)

        }
        let no = UIAlertAction(title: "No", style: .default)
        alert.addAction(update)
        alert.addAction(no)
        present(alert, animated: true, completion: nil)

    }
    
  
    
}

