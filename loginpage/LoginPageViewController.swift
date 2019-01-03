//
//  LoginPageViewController.swift
//  loginpage
//
//  Created by pruthvi on 06/10/18.
//  Copyright © 2018 pruthvi. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {
    var str_login: String = "http://localhost:8080/farming/webservices/login.php?"
    
   // "http://localhost:8080/farming/webservices/login.php?user=urvi@gmail.com&pwd=urvi"
    //http://localhost:8080/farming/webservices/login.php?user=urvi@gmail.com&psw=urvi
    @IBOutlet weak var image_logo: UIImageView!
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var forgetpassword: UIButton!
    
    @IBOutlet weak var log_button: UIButton!
    
    @IBOutlet weak var signin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func but_forget(_ sender: Any) {
    }
    
    @IBAction func but_login(_ sender: Any) {
        
        print(str_login)
        str_login.append("um_mail=")
        str_login.append(username.text!)
        str_login.append("&um_psw=")
        str_login.append(password.text!)
        
        print(str_login)
        let url = URL(string: str_login)
        //////////////////////
        do {
            if let file = URL(string: str_login) {
                print("value of",file)
                let data = try Data(contentsOf: url!)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    // json as a dictionary
                    for (key,value) in object{
                        print("\(key) : \(value)")
                    }
                    print(object)
                    
                    if object.keys.contains("success") && object["success"] as! Int == 200 {
                        // contains key
                        print("value is equal")
                        self.navigation()
                    } else {
                        // does not contain key
                        print("value is not equal")
                    }
                    //self.present(alert, animated: true)
                    
                } else if let object = json as? [Any] {
                    // json is an array
                    for anItem in object as! [Dictionary<String, AnyObject>] {
                        print("Item",anItem)
                        //let industryName = anItem["name"] as! String
                        //let industryID = anItem["id"] as! Int
                        //let industry = industryID(name: industryName, id:industryID)
                        // industries[industryID] = industry
                        //industries[industryID]?.getString()
                    }
                } else {
                    print("JSON is invalid")
                    //alertmessage = "JSON is invalid"
                    //alertaddAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    //self.present(alert, animated: true)
                }
            } else {
                print("no file")
                //alertmessage = "No such file Found"
                //alertaddAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                //self.present(alert, animated: true)
            }
        } catch {
            print(error.localizedDescription)
            //alertmessage = error.localizedDescription
            //alertaddAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            //self.present(alert, animated: true)
        }
        //////////////////////
    }
    
    @IBAction func but_signup(_ sender: Any) {
        
    }
    
    func myHandler(alert: UIAlertAction){
        //        print("You tapped: \(String(describing: alert.title))")
        
        //if same storyboard.
        //        let vc = Homescreen?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        //        let navigationController = UINavigationController(rootViewController: vc)
        //        self.present(navigationController, animated: true, completion: nil)
        
        //        let storyBoard: UIStoryboard = UIStoryboard(name: "Homescreen", bundle: nil)
        //
        //        let vc = storyBoard.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        //        let navigationController = UINavigationController(rootViewController: vc)
        //        self.present(navigationController, animated: false, completion: nil)
    }
    
    func navigation() {
        //let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard?.instantiateViewController(withIdentifier: "Home") as! HomeVC
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: false, completion: nil)
    }
}
