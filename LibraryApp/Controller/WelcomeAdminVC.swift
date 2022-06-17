//
//  WelcomeAdminVC.swift
//  LibraryApp
//
//  Created by cdp on 11/06/22.
//

import UIKit

class WelcomeAdminVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func membersListBtn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "memberlist") as! MemberListVC
        show(vc, sender: self)
        
    }
    @IBAction func booksListBtn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "booksearch") as! BookListVC
        show(vc, sender: nil)
    }
    
    @IBAction func libraryCardRequestBtn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "requestlist") as! LibraryCardIssueListVC
        show(vc, sender: nil)
    }
    
    @IBAction func homeBtn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "home") as! ViewController
        show(vc, sender: nil)
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
