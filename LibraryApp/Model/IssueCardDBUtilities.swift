//
//  IssueCardDBUtilities.swift
//  LibraryApp
//
//  Created by cdp on 15/06/22.
//

import Foundation
//func saveCardDetails(cardNumber: Int, status: String)
//{
//    let loggedInUser = Auth.auth().currentUser
//
//    if let user = loggedInUser{
//
//        let uNode = dbRef.child("Users").child(user.uid).child("Library card details")
//        uNode.child("Card Number").setValue(cardNumber)
//        uNode.child("Status").setValue(status)
//    }
//}
//func saveCardRequestDetails(fullname:String, email: String){
//
//    let loggedInUser = Auth.auth().currentUser
//    let uAccount = IssueCard(email: email, fullname: fullname)
//
//    if let user = loggedInUser {
//        dbRef.child("Requests for library card").child(user.uid).setValue(uAccount.cardDict())
//    }
//
////        let uAccount = IssueCard(email: email, fullname: fullname)
////        dbRef.child("Requests").child().setValue(uAccount.cardDict())
//
//
//}
//
//func getCardDetails(completionHandler: @escaping (IssueCard) -> Void) {
//
//
//    let loggedInUser = Auth.auth().currentUser
//
//    if let user = loggedInUser {
//        // read from realtime database
//
//        let uNode = dbRef.child("Requests for library card").child(user.uid)
//
//        uNode.getData { err, snapshot in
//
//            if err == nil {
//
//                let info = snapshot?.value as! Dictionary<String, String>
//                let email = info["email"] ?? ""
//                let fullname = info["fullname"] ?? ""
//               
//               print("\(fullname)")
//                print("\(email)")
//
//                let acc = IssueCard(email: email, fullname: fullname)
//
//                completionHandler(acc)
//            }
//        }
//    }
//}
