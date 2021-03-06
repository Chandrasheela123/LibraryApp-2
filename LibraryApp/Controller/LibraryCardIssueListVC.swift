//
//  LibraryCardIssueListVC.swift
//  LibraryApp
//
//  Created by cdp on 13/06/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class LibraryCardIssueListVC: UIViewController {
    
    @IBOutlet weak var tbl: UITableView!
    
    var dbref : DatabaseReference?
    var dbHandle : DatabaseHandle?
    var postData = [IssueLibraryCard]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tbl.layer.cornerRadius = 20.0
        tbl.delegate = self
        tbl.dataSource = self
        
        // Do any additional setup after loading the view.
        
        dbref = Database.database().reference().child("Library card details").child("Requests for library card")
        
        
        dbref!.observe(DataEventType.value, with: {(DataSnapshot) in
            
            if DataSnapshot.childrenCount > 0 {
                
                print("has children")
                
                for users in DataSnapshot.children.allObjects as![DataSnapshot]{
                    
                    let userObject = users.value as? [String: AnyObject]
                    
                    let name = userObject?["fullname"]
                    let email = userObject?["email"]
                    
                    let book = IssueLibraryCard(name: name as? String , email: email as? String)
                    
                    print("books")
                    self.postData.append(book)
                    print("appended")
                    
                    
                }
                self.tbl.reloadData()
                
            }
        })
    }
    
    @IBAction func backBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "admin") as! WelcomeAdminVC
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
extension LibraryCardIssueListVC : UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tbl.dequeueReusableCell(withIdentifier: "request", for: indexPath)
        
        let book : IssueLibraryCard
        book = postData[indexPath.row]
        cell.layer.cornerRadius = 10.0
        cell.textLabel?.text = book.name
        cell.detailTextLabel?.text = book.email
        
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

extension LibraryCardIssueListVC : UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "card") as! IssueLibraryCardVC
        show(vc, sender: self)
    }
}

