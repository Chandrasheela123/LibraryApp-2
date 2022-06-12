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
    init(bookname : String? , noOfBooks : String?) {
        
        self.bookname = bookname
        self.noOfBooks = noOfBooks
    }
}
