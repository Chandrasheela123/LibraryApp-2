//
//  DBUtilities.swift
//  LibraryApp
//
//  Created by cdp on 11/06/22.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage

import UIKit
import CoreLocation

struct Account {
    
    var email : String
    var mobile : String
    var fullname : String
    var city : String
    var password : String
    
    // object to dictionary conversion
    func toDict() -> [String : String] {
        ["fullname": fullname, "email" : email, "city": city, "mobile" : mobile, "password" : password]
    }
    
}

struct Books {
    
    var bookName : String
    var numberOfBooks : String
    var author : String
    var publicationDate : String
    var bookID : String
    
    func bookDict() -> [String : String]{
        ["bookID" : bookID , "bookname" : bookName, "numberOfBooks" : numberOfBooks, "author": author, "publicationDate": publicationDate]
    }
}

struct IssueCard {
    
    var email : String
    var fullname : String
    
    func cardDict() -> [String : String] {
        ["fullname": fullname, "email" : email]
    }
}

struct BorrowedBooks {
    
    var bookname : String
    var borrowDate : String
    var returnDate : String
    
    func borrowedDict() -> [String : String]{
        ["bookname" : bookname, "borrowDate": borrowDate, "returnDate" : returnDate]
    }
}
class DBUtility {
    
    private init(){}
    
    static let instance = DBUtility()
    
    let dbRef = Database.database().reference()
    let loggedInUser = Auth.auth().currentUser
 
    func saveBorrowedBooksDetails(bookname: String, borrowDate : String, returnDate: String)
    {
        let loggedInUser = Auth.auth().currentUser
        
        let borrowed = BorrowedBooks(bookname: bookname, borrowDate: borrowDate, returnDate: returnDate)
        
        if let user = loggedInUser{
            dbRef.child("Users").child(user.uid).child("Borrowed books details").childByAutoId().setValue(borrowed.borrowedDict())
            
//            let uNode = dbRef.child("Users").child(user.uid).child("Borrowed books details").child(bookname)
//            uNode.child("Book Name").setValue(bookname)
//            uNode.child("Borrow Date").setValue(borrowDate)
//            uNode.child("Return Date").setValue(returnDate)
        }
        
    }
  
    func getBorrowedDetails(completionHandler: @escaping (BorrowedBooks) -> Void) {
        // get logged in user
        let loggedInUser = Auth.auth().currentUser
        
        if let user = loggedInUser {
            // read from realtime database
            
            let uNode = dbRef.child("Users").child(user.uid).child("Borrowed books details")
            
            uNode.getData { err, snapshot in
                
                if err == nil {
                    
                    let info = snapshot?.value as! Dictionary<String, String>
                    
                    let bookname = info["BookName"] ?? ""
                    let borrowedDate = info["Borrowed Date"] ?? ""
                    let returnDate = info["Return Date"] ?? ""
                   
                    
                   
                    let acc = BorrowedBooks(bookname: bookname, borrowDate: borrowedDate, returnDate: returnDate)
                    
                    completionHandler(acc)
                }
            }
        }
    }
    
      func saveUserDetails(fullname:String, email: String, city: String, mobile: String, password: String){
          
          let loggedInUser = Auth.auth().currentUser
          
          let uAccount = Account(email: email, mobile: mobile, fullname: fullname, city: city, password: password)
          
          if let user = loggedInUser {
              dbRef.child("Users").child(user.uid).setValue(uAccount.toDict())
          }
          
      }
    
    
    func getUserDetails(completionHandler: @escaping (Account) -> Void) {
        // get logged in user
        let loggedInUser = Auth.auth().currentUser
        
        if let user = loggedInUser {
            // read from realtime database
            
            let uNode = dbRef.child("Users").child(user.uid)
            
            uNode.getData { err, snapshot in
                
                if err == nil {
                    
                    let info = snapshot?.value as! Dictionary<String, String>
                    
                    let email = info["email"] ?? ""
                    let mobile = info["mobile"] ?? ""
                    let fullname = info["fullname"] ?? ""
                    let city = info["city"] ?? ""
                    let password = info["password"] ?? ""
                    
                    print("\(fullname)")
                    print("\(email)")
                    print("\(mobile)")
                    print("\(city)")
                    
                    
                    let acc = Account(email: email, mobile: mobile, fullname: fullname, city: city, password: password)
                    
                    completionHandler(acc)
                }
            }
        }
    }
    
    func saveBooksDetails(bookID: String, bookName: String, numberOfBooks: String, author: String, publicationDate: String){
        
        let bookAccount = Books(bookName: bookName, numberOfBooks: numberOfBooks, author: author, publicationDate: publicationDate, bookID: bookID)
        dbRef.child("BooksList").child(bookID).setValue(bookAccount.bookDict())
        
        
    }
    
    func getBooksDetails(completionHandler: @escaping (Books) -> Void) {
            
            let uNode = dbRef.child("Users").child("BookID")
            
            uNode.getData { err, snapshot in
                
                if err == nil {
                    
                    let info = snapshot?.value as! Dictionary<String, String>
                    
                    let bookName = info["Book Name"] ?? ""
                    let numberOfBooks = info["Number of Books"] ?? ""
                    let author = info["Author"] ?? ""
                    let publicationDate = info["Publication Date"] ?? ""
                    let bookID = info["BookID"] ?? ""
                    
                    
                    print("\(bookName)")
                    print("\(numberOfBooks)")
                    print("\(author)")
                    print("\(publicationDate)")
                    
                    
                    let book = Books(bookName: bookName, numberOfBooks: numberOfBooks, author: author, publicationDate: publicationDate, bookID: bookID)
                    completionHandler(book)
                
            }
        }
    }

    func saveCardRequestDetails(fullname:String, email: String){

        let loggedInUser = Auth.auth().currentUser
        let uAccount = IssueCard(email: email, fullname: fullname)
        
        if let user = loggedInUser {
            dbRef.child("Requests for library card").child(user.uid).setValue(uAccount.cardDict())
        }

//        let uAccount = IssueCard(email: email, fullname: fullname)
//        dbRef.child("Requests").child().setValue(uAccount.cardDict())
        

    }

    func getCardDetails(completionHandler: @escaping (IssueCard) -> Void) {
      

        let loggedInUser = Auth.auth().currentUser
        
        if let user = loggedInUser {
            // read from realtime database
            
            let uNode = dbRef.child("Requests for library card").child(user.uid)
            
            uNode.getData { err, snapshot in
                
                if err == nil {
                    
                    let info = snapshot?.value as! Dictionary<String, String>
                    let email = info["email"] ?? ""
                    let fullname = info["fullname"] ?? ""
                   
                   print("\(fullname)")
                    print("\(email)")
                    
                    let acc = IssueCard(email: email, fullname: fullname)
                    
                    completionHandler(acc)
                }
            }
        }
}
    
    func saveCardDetails(cardNumber: Int, status: String)
    {
        let loggedInUser = Auth.auth().currentUser
        
        if let user = loggedInUser{
            
            let uNode = dbRef.child("Users").child(user.uid).child("Library card details")
            uNode.child("Card Number").setValue(cardNumber)
            uNode.child("Status").setValue(status)
        }
    }
    
    

}




