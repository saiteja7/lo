//
//  ViewController.swift
//  lo
//
//  Created by Saiteja on 05/08/16.
//  Copyright © 2016 Saiteja. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    
    @IBOutlet var usernameLabel: UILabel!
    
    @IBOutlet var emailField: UITextField!

    @IBOutlet var passwordField: UITextField!
    @IBOutlet var logoutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        if let user = FIRAuth.auth()?.currentUser{
            self.logoutButton.alpha = 1.0
            self.usernameLabel.text = user.email
            
            
        }
        else{
            self.logoutButton.alpha = 0.0
            self.usernameLabel.text = ""
        }

        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func createAccountAction(sender: AnyObject) {
        
        if self.emailField.text == "" || self.passwordField.text == "" {
            let alertcontroller = UIAlertController(title: "ooops", message: "please enter email and password", preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "ok", style: .Cancel, handler: nil)
            alertcontroller.addAction(defaultAction)
            self.presentViewController(alertcontroller, animated: true, completion: nil)
            
            
        }
        else{
            FIRAuth.auth()?.createUserWithEmail(self.emailField.text!, password: self.passwordField.text!, completion: { (user, error) in
                
                if error == nil{
                    self.logoutButton.alpha = 1.0
                    self.emailField.text = user!.email
                    self.emailField.text = ""
                    self.passwordField.text = ""
                }
                else{
                    let alertcontroller = UIAlertController(title: "ooops", message: error?.localizedDescription, preferredStyle: .Alert)
                    let defaultAction = UIAlertAction(title: "ok", style: .Cancel, handler: nil)
                    alertcontroller.addAction(defaultAction)
                    self.presentViewController(alertcontroller, animated: true, completion: nil)
                    
                    
                }
            })
        }
        

        
        
    }

    @IBAction func loginAction(sender: AnyObject) {
        
        if self.emailField.text == "" || self.passwordField.text == "" {
            let alertcontroller = UIAlertController(title: "ooops", message: "please enter email and password", preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "ok", style: .Cancel, handler: nil)
            alertcontroller.addAction(defaultAction)
            self.presentViewController(alertcontroller, animated: true, completion: nil)
            
        }
        else{
            FIRAuth.auth()?.signInWithEmail(emailField.text!, password: passwordField.text!, completion: { (user, error) in
                
                if error == nil{
                    self.logoutButton.alpha = 1.0
                    self.emailField.text = user!.email
                    self.emailField.text = ""
                    self.passwordField.text = ""
                    
                    
                    
                }
                else{
                    let alertcontroller = UIAlertController(title: "ooops", message: error?.localizedDescription, preferredStyle: .Alert)
                    let defaultAction = UIAlertAction(title: "ok", style: .Cancel, handler: nil)
                    alertcontroller.addAction(defaultAction)
                    self.presentViewController(alertcontroller, animated: true, completion: nil)
                    
                    
                    
                }
            })
        }
        

        
    }
    @IBAction func logoutAction(sender: AnyObject) {
        try! FIRAuth.auth()!.signOut()
        self.usernameLabel.text = ""
        self.logoutButton.alpha = 0.0
        self.emailField.text = ""
        self.passwordField.text = ""
    }
}

