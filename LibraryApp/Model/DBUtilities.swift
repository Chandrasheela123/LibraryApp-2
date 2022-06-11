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
    
    
    
    
    // object to dictionary conversion
    func toDict() -> [String : String] {
        ["fullname": fullname, "email" : email, "city": city, "mobile" : mobile]
    }
    
}

class DBUtility {
    
    private init(){}
    
    static let instance = DBUtility()
    
    let dbRef = Database.database().reference()
    let loggedInUser = Auth.auth().currentUser
    
    func saveUserDetails(fullname:String, email: String, city: String, mobile: String){
        
        let loggedInUser = Auth.auth().currentUser
        
        let uAccount = Account(email: email, mobile: mobile, fullname: fullname, city: city)
        
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
                    
                    print("\(fullname)")
                    print("\(email)")
                    print("\(mobile)")
                    print("\(city)")
                    
                    
                    let acc = Account(email: email, mobile: mobile, fullname: fullname, city: city)
                    
                    completionHandler(acc)
                }
            }
        }
    }
    
//    func updateProfilePic(picurl: String){
//
//        let loggedInUser = Auth.auth().currentUser
//
//        if let user = loggedInUser {
//            // read from realtime database
//
//            let uNode = dbRef.child("Users").child(user.uid)
//
//            uNode.child("profileUrl").setValue(picurl)
//
//            print("Image Url: \(picurl)")
//        }
//
//    }
    
//    func getCoordFromAddress(address : String, completion: @escaping (CLLocation) -> Void) {
//
//        let gc = CLGeocoder()
//        gc.geocodeAddressString(address) {places, err in
//            if err == nil {
//                if let placeList = places {
//
//                    let place = placeList[0]
//                    if let loc = place.location {
//                        print("got latitude")
//                        completion(loc)
//                    }
//                }
//            }
//            else
//            {
//                print("ERROR: \(err?.localizedDescription ?? "")")
//
//            }
//        }
//
//    }
    
//    func getCoord(lat : Double, long: Double)
//    {
//        let loggedInUser = Auth.auth().currentUser
//
//        if let user = loggedInUser {
//            // read from realtime database
//
//            let uNode = dbRef.child("Users").child(user.uid)
//
//            uNode.child("latitude").setValue(lat)
//            uNode.child("longitude").setValue(long)
//
//
//        }
//    }
//
//    func calculateDistance(){
//
//        let coor1 = CLLocation(latitude: <#CLLocationDegrees#>, longitude: <#T##CLLocationDegrees#>)
//        let coor2 = CLLocation(latitude: <#T##CLLocationDegrees#>, longitude: <#T##CLLocationDegrees#>)
//
//        let distance = coor1.distance(from: coor2)
//
//        if(distance <= 10000)
//        {
//
//        }
//
//
//
//    }
}






