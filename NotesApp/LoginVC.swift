//
//  LoginVC.swift
//  NotesApp
//
//  Created by Sandhya Baghel on 11/07/21.
//  Copyright © 2021 Sandhya. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    private let logo: UILabel = {
        let logo = UILabel()
        logo.text = "note !t"
        logo.textColor = .white
        logo.textAlignment = .center
        logo.font = UIFont(name: "arial", size: 42)
        return logo
    }()
    
    private let username : UITextField = {
        let textView = UITextField()
        textView.placeholder = "Username"
        textView.textAlignment = .center
        textView.backgroundColor = .systemGray6
        textView.layer.cornerRadius = 10
        return textView
    }()

    private let password : UITextField = {
        let textView = UITextField()
        textView.placeholder = "Password"
        textView.textAlignment = .center
        textView.backgroundColor = .systemGray6
        textView.layer.cornerRadius = 10
        return textView
    }()

    private let btn : UIButton = {
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.addTarget(self, action: #selector(login), for: .touchUpInside)
        btn.layer.cornerRadius = 10
        return btn
    }()

    @objc func login() {
        if(username.text == "Admin" && password.text == "Admin")
        {
            let vc = NoteVC()
            navigationController?.pushViewController(vc, animated: true)
            UserDefaults.standard.setValue(username.text, forKey: "username")
            UserDefaults.standard.setValue("asdfgdewseds", forKey: "session token")
            self.dismiss(animated: true)
        }
        else
        {
            let alert = UIAlertController(title: "Please Enter Correct Credentials", message: "Incorrect Username Or Password", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Close", style: .cancel))
            DispatchQueue.main.async {
                self.present(alert, animated: true) {
                    self.username.text = ""
                    self.password.text = ""
                    
                }
            }
        }
    }
       
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(logo)
        view.addSubview(username)
        view.addSubview(password)
        view.addSubview(btn)
        view.backgroundColor = .systemGreen
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logo.frame = CGRect(x: view.width/2-150, y: 150, width: 300, height: 100)
        username.frame = CGRect(x: 30, y: logo.bottom + 20, width: view.width - 60, height: 40)
        password.frame = CGRect(x: 30, y: username.bottom + 20, width: view.width - 60, height: 40)
        btn.frame = CGRect(x: 30, y: password.bottom + 30, width: view.width - 60, height: 40)
    }
}
