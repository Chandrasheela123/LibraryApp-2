//
//  ViewController.swift
//  Sprint2
//
//  Created by Capgemini_DA078 on 6/9/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func libraryMemberBtn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "login") as! LoginVC
        show(vc, sender: self)
    }
    @IBAction func librarianBtn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "login") as! LoginVC
        show(vc, sender: self)
    }
}

