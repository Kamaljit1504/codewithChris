//
//  ViewController.swift
//  codewithChris
//
//  Created by MacStudent on 2019-11-05.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblusername: UILabel!
    @IBOutlet weak var lblpassword: UILabel!
    var uDefault : UserDefaults!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnReMMe: UISwitch!
    
override func viewDidLoad() {
        super.viewDidLoad()        // Do any additional setup after loading the view.
    }

    
    @IBAction func btnlogin(_ sender: UIButton)
    {
    if readInformationPlist()
    {
      
        if self.btnReMMe.isOn
      {
        self.uDefault.set(txtUsername.text, forKey: "username")
        self.uDefault.set(txtPassword.text, forKey: "password")
        }
      
      else{
        self.uDefault.removeObject(forKey: "username")
        self.uDefault.removeObject(forKey: "password")
        }
        
      //  let sb=UIStoryboard(name: "Main", bundle: nil)
        
    }
    
    else
    {
        let alert = UIAlertController(title: "Wrong Username Or Password", message: "change username or password", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: {action
            in
            print("Cancle clicked")
        }))
        self.present(alert, animated: true)
        print("invalid username or password")
    }
    }
    
    func readInformationPlist() -> Bool{
        if let bundlePath = Bundle.main.path(forResource: "Users", ofType: "plist") {
            let dictionary = NSMutableDictionary(contentsOfFile: bundlePath)
            let usersList = dictionary!["User"] as! NSArray
            
            for u in usersList
            {
                let user = u as! NSDictionary
                let uname = user["username"]! as! String
                let pwd = user["password"]! as! String
                if uname==txtUsername.text! && pwd==txtPassword.text!
                {
                    return true
                }
            }
            
            
        }
        return false
    }



}

