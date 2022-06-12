//
//  MemberListVC.swift
//  LibraryApp
//
//  Created by cdp on 11/06/22.
//

import UIKit
import FirebaseDatabase

class MemberListVC: UIViewController {

   
    @IBOutlet weak var tbl: UITableView!
    
    var dbref : DatabaseReference?
    var dbHandle : DatabaseHandle?
    var postData = [MembersDetails]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tbl.delegate = self
        tbl.dataSource = self
        
        // Do any additional setup after loading the view.
        
        dbref = Database.database().reference().child("Users")
        
        dbref!.observe(DataEventType.value, with: {(DataSnapshot) in
            
            if DataSnapshot.childrenCount > 0 {
                
                print("has children")
                
                for users in DataSnapshot.children.allObjects as![DataSnapshot]{
                    
                    let userObject = users.value as? [String: AnyObject]
                    
                    let fullname = userObject?["fullname"]
                    let city = userObject?["city"]
                    let email = userObject?["email"]
                    let mobile = userObject?["mobile"]
                    
                    
                    let members = MembersDetails(name: fullname as? String, city: city as? String, email: email as? String, mobile: mobile as? String)
                    
                    print("employee")
                    self.postData.append(members)
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

extension MemberListVC : UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tbl.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MembersListCell
        
        let emp : MembersDetails
        emp = postData[indexPath.row]
        
        cell.nameLbl.text = emp.name
        cell.mobileNoLbl.text = emp.mobile
        cell.emailIDLbl.text = emp.email
        
        
        return cell
    }
}

extension MemberListVC : UITableViewDelegate
{
    
    
}
