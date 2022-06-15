//
//  SearchBookVC.swift
//  LibraryApp
//
//  Created by cdp on 12/06/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SearchBookVC: UIViewController {

    @IBOutlet weak var tbl: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var dbref : DatabaseReference?
    var dbHandle : DatabaseHandle?
    var postData = [UserBookList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tbl.layer.cornerRadius = 20.0
        tbl.delegate = self
        tbl.dataSource = self
        
        // Do any additional setup after loading the view.
        
        dbref = Database.database().reference().child("BooksList")
        
        
        dbref!.observe(DataEventType.value, with: {(DataSnapshot) in
            
            if DataSnapshot.childrenCount > 0 {
                
                print("has children")
                
                for users in DataSnapshot.children.allObjects as![DataSnapshot]{
                    
                    let userObject = users.value as? [String: AnyObject]
                    
                    let bookName = userObject?["bookname"]
                    let author = userObject?["author"]
                    let publicationDate = userObject?["publicationDate"]
                    
                    let book = UserBookList(bookname: bookName as? String, author: author as? String, publicationDate: publicationDate as? String)
                    
                    print("books")
                    self.postData.append(book)
                    print("appended")
                    
                    
                }
                self.tbl.reloadData()
                
            }
        })
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
extension SearchBookVC : UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tbl.dequeueReusableCell(withIdentifier: "userbooklist", for: indexPath) as! UsersBookListCell
        
        let book : UserBookList
        book = postData[indexPath.row]
        cell.layer.cornerRadius = 10
        cell.booknameLbl.text = book.bookname
        cell.authorLbl.text = book.author
        cell.publicationDateLbl.text = book.publicationDate
        
        return cell
    }
}

extension SearchBookVC : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

        let alert = UIAlertController(title: "Do you want to borrow this book?", message: "Borrow this book only for 7 days", preferredStyle: .alert)
        let update = UIAlertAction(title: "Yes", style: .default) { _ in

            let vc = self.storyboard?.instantiateViewController(withIdentifier: "borrowdetails") as! BorrowBooksDetailsVC
            vc.bookname = self.postData[indexPath.row].bookname ?? ""
            self.show(vc, sender: self)

        }
       let no = UIAlertAction(title: "No", style: .default)
        alert.addAction(update)
        alert.addAction(no)
        present(alert, animated: true, completion: nil)

    }
}

