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

class DBUtility {
    
    private init(){}
    
    static let instance = DBUtility()
    
    let dbRef = Database.database().reference()
    let loggedInUser = Auth.auth().currentUser
    
    func saveUserDetails(fullname:String, email: String, city: String, mobile: String, password: String){
        
        let loggedInUser = Auth.auth().currentUser
        
        let uAccount = Account(email: email, mobile: mobile, fullname: fullname, city: city, password: password)
        
        if let user = loggedInUser {
            dbRef.child("Users").child(user.uid).setValue(uAccount.toDict())
        }
        
    }
    
    func saveBooksDetails(bookID: String, bookName: String, numberOfBooks: String, author: String, publicationDate: String){
        
        let bookAccount = Books(bookName: bookName, numberOfBooks: numberOfBooks, author: author, publicationDate: publicationDate, bookID: bookID)
        dbRef.child("BooksList").childByAutoId().setValue(bookAccount.bookDict())
        
        
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
    
}






