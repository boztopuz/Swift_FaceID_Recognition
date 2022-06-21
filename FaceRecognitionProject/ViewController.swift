//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by Burak Öztopuz on 30.05.2022.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInButton(_ sender: Any) {
        let authContext = LAContext()
        var error : NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?") { success, error in
                
                if success == true{
                DispatchQueue.main.async {
                    self.myLabel.text = "Sign In"
                    self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                }
                }else{
                    DispatchQueue.main.async {
                        self.myLabel.text = "Error!"
                    }
                }
            }
        }
    }
    
}

