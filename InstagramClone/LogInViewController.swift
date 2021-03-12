//
//  LogInViewController.swift
//  InstagramClone
//
//  Created by Manny Reyes on 3/10/21.
//

import UIKit
import Parse //parse not implemented yet

class LogInViewController: UIViewController {

   
    @IBOutlet weak var usernamField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernamField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password){
            (user, error) in
            if user != nil{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                print("Error: \(error?.localizedDescription)")
                
            }
            
        }
        
        
    }
    
    
    @IBAction func onSignUp(_ sender: Any) {
        var user = PFUser()
        user.username = usernamField.text
        user.password = passwordField.text
        
        user.signUpInBackground{ (success, error) in
            if success{
                ///succeeded in signing up
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                print("Error: \(error?.localizedDescription)")
            }
        }    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
