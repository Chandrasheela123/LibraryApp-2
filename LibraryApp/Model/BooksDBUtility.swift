////
////  BooksDBUtility.swift
////  LibraryApp
////
////  Created by cdp on 15/06/22.
////
//
//import Foundation
//struct Books {
//    
//    var bookName : String
//    var numberOfBooks : String
//    var author : String
//    var publicationDate : String
//    var bookID : String
//    
//    func bookDict() -> [String : String]{
//        ["bookID" : bookID , "bookname" : bookName, "numberOfBooks" : numberOfBooks, "author": author, "publicationDate": publicationDate]
//    }
//}
//
//struct BorrowedBooks {
//    
//    var bookname : String
//    var borrowDate : String
//    var returnDate : String
//    
//    func borrowedDict() -> [String : String]{
//        ["bookname" : bookname, "borrowDate": borrowDate, "returnDate" : returnDate]
//    }
//}
//
//func saveBorrowedBooksDetails(bookname: String, borrowDate : String, returnDate: String)
//{
//    let loggedInUser = Auth.auth().currentUser
//
//    let borrowed = BorrowedBooks(bookname: bookname, borrowDate: borrowDate, returnDate: returnDate)
//
//    if let user = loggedInUser{
//        dbRef.child("Users").child(user.uid).child("Borrowed books details").child(bookname).setValue(borrowed.borrowedDict())
//
////            let uNode = dbRef.child("Users").child(user.uid).child("Borrowed books details").child(bookname)
////            uNode.child("Book Name").setValue(bookname)
////            uNode.child("Borrow Date").setValue(borrowDate)
////            uNode.child("Return Date").setValue(returnDate)
//    }
//
//}
//
//func getBorrowedDetails(completionHandler: @escaping (BorrowedBooks) -> Void) {
//    // get logged in user
//    let loggedInUser = Auth.auth().currentUser
//
//    if let user = loggedInUser {
//        // read from realtime database
//
//        let uNode = dbRef.child("Users").child(user.uid).child("Borrowed books details")
//
//        uNode.getData { err, snapshot in
//
//            if err == nil {
//
//                let info = snapshot?.value as! Dictionary<String, String>
//
//                let bookname = info["BookName"] ?? ""
//                let borrowedDate = info["Borrowed Date"] ?? ""
//                let returnDate = info["Return Date"] ?? ""
//
//
//
//                let acc = BorrowedBooks(bookname: bookname, borrowDate: borrowedDate, returnDate: returnDate)
//
//                completionHandler(acc)
//            }
//        }
//    }
//}

//func saveBooksDetails(bookID: String, bookName: String, numberOfBooks: String, author: String, publicationDate: String){
//    
//    let bookAccount = Books(bookName: bookName, numberOfBooks: numberOfBooks, author: author, publicationDate: publicationDate, bookID: bookID)
//    dbRef.child("BooksList").child(bookID).setValue(bookAccount.bookDict())
//    
//    
//}
