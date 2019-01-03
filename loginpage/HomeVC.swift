//
//  HomeVC.swift
//  loginpage
//
//  Created by Prashantdan on 24/10/18.
//  Copyright © 2018 pruthvi. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOut(_ sender: Any) {
        //let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let vc = storyboard?.instantiateViewController(withIdentifier: "LoginHome") as! ViewController
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: false, completion: nil)
    }
}
