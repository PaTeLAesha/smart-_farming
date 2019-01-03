//
//  Reg_PageViewController.swift
//  loginpage
//
//  Created by pruthvi on 06/10/18.
//  Copyright © 2018 pruthvi. All rights reserved.
//

import UIKit

class Reg_PageViewController: UIViewController {

    var str_User_registration: String = "http://localhost:8080/farming/webservices/registration.php?"
    
    @IBOutlet weak var txt_Fname: UITextField!
    @IBOutlet weak var txt_Lname: UITextField!
    @IBOutlet weak var txt_emailid: UITextField!
    @IBOutlet weak var txt_password: UITextField!
    
    @IBOutlet weak var txt_RePass: UITextField!
    
    @IBOutlet weak var txt_Area: UITextField!
    @IBOutlet weak var txt_Mobile: UITextField!
    
    @IBOutlet weak var txtv_Add: UITextView!
    
    @IBOutlet weak var btn_Singup: UIButton!
    
    let alert = UIAlertController(title: "Login", message: "Test Message", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func but_signin(_ sender: Any) {
        
        str_User_registration.append("um_name=")
        str_User_registration.append(txt_Fname.text!)
        str_User_registration.append(txt_Lname.text!)
        str_User_registration.append("&um_psw=")
        str_User_registration.append(txt_password.text!)
        str_User_registration.append("&um_cnct=")
        str_User_registration.append(txt_Mobile.text!)
        str_User_registration.append("&um_mail=")
        str_User_registration.append(txt_emailid.text!)
        
        
        let url = URL(string: str_User_registration)
        //////////////////////
        do {
            if let file = URL(string: str_User_registration) {
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
        self.navigationController?.popToRootViewController(animated: true)
        //let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
       // let vc = storyboard?.instantiateViewController(withIdentifier: "Home") as! HomeVC
        //let navigationController = UINavigationController(rootViewController: vc)
        //self.present(navigationController, animated: false, completion: nil)
    }

}
