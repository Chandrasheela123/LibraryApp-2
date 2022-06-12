//
//  ViewController.swift
//  Sprint2
//
//  Created by Capgemini_DA078 on 6/9/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func segmentControlClick(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
            
        case 0 :
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "login") as! LoginVC
            self.show(vc, sender: nil)
    
        default:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "login") as! LoginVC
            self.show(vc, sender: nil)
        }
        
    
        
        
    }
    
}

