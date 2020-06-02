//
//  SessionStore.swift
//  SwiftTemp
//
//  Created by 하창진 on 2020/06/02.
//  Copyright © 2020 하창진. All rights reserved.
//

import SwiftUI
import Firebase
import Combine

class SessionStore : BindableObject{
    var didChange = PassthroughSubject<SessionStore, Never>()
    var session: User?{didSet{self.didChange.send(self)}}
    var handle : AuthStateDidChangeListenerHandle?
    
    func listen(){
        handle = Auth.auth().addStateDidChangeListener{(auth, user) in
            if let user = user{
                self.session = User(uid : user.uid, displayName: user.displayName)
            }
            
            else{
                self.session = nil
            }
        }
    }
    
    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback){
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    func unbind(){
        if let handle = handle{
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
}

class User{
    var uid: String
    var email: String?
    var displayName: String?
    
    init(uid: String, displayName: String?, email: String?){
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
}
