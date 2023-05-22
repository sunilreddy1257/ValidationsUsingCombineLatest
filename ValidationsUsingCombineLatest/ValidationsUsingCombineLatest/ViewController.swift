//
//  ViewController.swift
//  ValidationsUsingCombineLatest
//
//  Created by Sunil Kumar Reddy Sanepalli on 22/05/23.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var mobileNumber: UITextField!
    
    @Published private var usernameVal: String = ""
    @Published private var nameVal: String = ""
    @Published private var mobileNumberVal: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signupButtonPressed(_ sender: UIButton) {
        
    }
    
}

//MARK: UITextField Delegate Methods
extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case username:
            usernameVal = textField.text ?? ""
        case name:
            nameVal = textField.text ?? ""
        case mobileNumber:
            mobileNumberVal = textField.text ?? ""
        default:
            break
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

