//
//  MemberDetailsUtility.swift
//  LibraryApp
//
//  Created by cdp on 11/06/22.
//

import Foundation
class MembersDetails {
    
    let name : String?
    let city : String?
    let email : String?
    let mobile : String?
    

    init(name : String?, city : String?, email : String?, mobile : String?){
        
        self.name = name
        self.city = city
        self.email = email
        self.mobile = mobile
      
    }
}
class BooksDetails {
    
    let bookname : String?
    let noOfBooks : String?
    let author : String?
    let publicationDate : String?
    let bookID : String?
    init(bookname : String? , noOfBooks : String?, author: String?, publicationDate: String?, bookID: String?) {
        
        self.bookname = bookname
        self.noOfBooks = noOfBooks
        self.author = author
        self.publicationDate = publicationDate
        self.bookID = bookID
    }
}


class UserBookList {
    let bookname : String?
    let author : String?
    let publicationDate : String?
    init(bookname : String? , author : String?, publicationDate : String?) {
        
        self.bookname = bookname
        self.author = author
        self.publicationDate = publicationDate
    }
}

class IssueLibraryCard {
    
    let name : String?
    let email : String?
    init(name: String?, email: String?) {
        
        self.name = name
        self.email = email
    }
}

class BorrowBookDetails{
    
    let bookname : String?
    let borrowDate : String?
    let returnDate: String?
    
    init(bookname: String?, borrowDate: String?, returnDate: String?)
    {
        self.bookname = bookname
        self.borrowDate = borrowDate
        self.returnDate = returnDate
    }
}
