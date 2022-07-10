//
//  SignUpWorker.swift
//  MovieApp
//
//  Created by Ronan Mak on 10/7/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Firebase

class SignUpWorker
{
    static let shared = SignUpWorker()

    func registerUser(email: String, password: String, username: String, completion: @escaping(Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in

            if let error = error {
                print("Failed to register user \(error.localizedDescription)")
                return
            }

            guard let uid = result?.user.uid else { return }

            var userData: [String: Any] = [
                "uid": uid,
                "email": email,
                "password": password,
                "username": username
            ]

            if let fcmToken = Messaging.messaging().fcmToken {
                userData["fcmToken"] = fcmToken
            }

            print("debug: wtf?")

            Firestore.firestore().collection("users").document(uid).setData(userData, completion: completion)
        }
    }
}
