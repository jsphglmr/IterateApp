//
//  Authentication.swift
//  IterateApp
//
//  Created by Joseph Gilmore on 6/7/23.
//

import Foundation
import LocalAuthentication

class Authentication: ObservableObject {
    @Published var isUnlocked = false

    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authenticate yourself to unlock your places."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    Task { @MainActor in
                        self.isUnlocked = true
                    }
                } else {
                    //error
                }
            }
        } else {
            //no biometrics
        }
    }
}
