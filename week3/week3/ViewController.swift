//
//  ViewController.swift
//  week3
//
//  Created by 蔡佳宣 on 2019/1/25.
//  Copyright © 2019年 蔡佳宣. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var checkLabel: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkTextField: UITextField!

 
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex{
        case 0:
            checkLabel.textColor = UIColor(red: 126/255.0, green: 126/255.0, blue: 126/255.0, alpha: 1.0)
            checkTextField.backgroundColor = UIColor(red: 128/255.0, green: 128/255.0, blue: 128/255.0, alpha: 1.0)
            checkTextField.isEnabled = false
        case 1:
            checkLabel.textColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)
            checkTextField.backgroundColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)
            checkTextField.textColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)
            checkTextField.isEnabled = true
        default:
            break
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        checkLabel.textColor = UIColor(red: 126/255.0, green: 126/255.0, blue: 126/255.0, alpha: 1.0)
        checkTextField.isEnabled = false
        checkTextField.backgroundColor = UIColor(red: 128/255.0, green: 128/255.0, blue: 128/255.0, alpha: 1.0)
    }
    
    func showAlertWith(message: String, style: UIAlertController.Style = .alert) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: style)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }



    @IBAction func loginButton() {
            if segmentControl.selectedSegmentIndex == 0{
                if accountTextField.text != "appwork_school@gmail.com" ||  passwordTextField.text != "1234"{
                    showAlertWith(message: "Login fail")
                    }
            }else if segmentControl.selectedSegmentIndex == 1{
                if accountTextField.text == "" {
                    showAlertWith(message: "Account should not be empty.")
                } else if passwordTextField.text == "" {
                    showAlertWith(message: "Password should not be empty.")
                } else if checkTextField.text == "" {
                    showAlertWith(message: "Check Password should not be empty.")
                } else if passwordTextField.text != checkTextField.text {
                    showAlertWith(message: "Signup fail")
                }
    }
  }
}
