//
//  WelcomeLibraryMembersVC.swift
//  LibraryApp
//
//  Created by cdp on 11/06/22.
//

import UIKit

class WelcomeLibraryMembersVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func borrowedBooksBtn(_ sender: Any) {

        let vc = storyboard?.instantiateViewController(withIdentifier: "borrowed") as! BorrowedBooksVC

        show(vc, sender: self)
    }
    @IBAction func searchBooksBtn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "usersearch") as! SearchBookVC
        
        show(vc, sender: self)
    }
    
    @IBAction func requestingForLibraryCardBtn(_ sender: Any) {
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
