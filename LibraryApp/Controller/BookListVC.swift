//
//  BookListVC.swift
//  LibraryApp
//
//  Created by cdp on 11/06/22.
//

import UIKit
import FirebaseDatabase

class BookListVC: UIViewController {
    
    @IBOutlet weak var searchBarTxt: UISearchBar!
    @IBOutlet weak var tbl: UITableView!
    
    
    var dbref : DatabaseReference?
    var dbHandle : DatabaseHandle?
    var postData = [BooksDetails]()
  //  var filteredUsers = [BooksDetails]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        tbl.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBarTxt.delegate = self
       // filteredUsers = postData
        
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
                    let noOfBooks = userObject?["numberOfBooks"]
                    
                    let book = BooksDetails(bookname: bookName as? String, noOfBooks: noOfBooks as? String)
                    
                    print("books")
                    self.postData.append(book)
                    print("appended")
                    
                    
                }
                self.tbl.reloadData()
                
            }
        })
    }
    
    @IBAction func backBtnClick(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "admin") as! WelcomeAdminVC
        show(vc, sender: self)
        
        
    }
    
    @IBAction func addBtnClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "add") as! AddBookVC
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

extension BookListVC : UITableViewDataSource, UISearchBarDelegate
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tbl.dequeueReusableCell(withIdentifier: "bookcell", for: indexPath) as! BookListCell
        
        let book : BooksDetails
        book = postData[indexPath.row]
        
        cell.booknameLbl.text = book.bookname
        cell.noOfBooksLbl.text = book.noOfBooks
        
        return cell
    }
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//        if searchText.isEmpty == false
//        {
//            filteredUsers = postData.filter({ $0.contains(searchText)})
//            tbl.reloadData()
//        }
//        else
//        {
//            filteredUsers = postData
//            tbl.reloadData()
//        }
//    }
}

extension BookListVC : UITableViewDelegate
{
    
    
}

