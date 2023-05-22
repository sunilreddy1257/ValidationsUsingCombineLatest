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
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    @Published private var usernameVal: String = ""
    @Published private var nameVal: String = ""
    @Published private var addressVal: String = ""
    
    private var subscriptions = Set<AnyCancellable>()
    
    private var validationPublisher: AnyPublisher<Bool, Never> {
        return Publishers.CombineLatest3($usernameVal, $nameVal, $addressVal)
            .map { usernameVal, nameVal, addressVal in
                !usernameVal.isEmpty && !addressVal.isEmpty && !nameVal.isEmpty
            }
            .eraseToAnyPublisher()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Using Sink
        /*validationPublisher.receive(on: RunLoop.main)
            .sink {[weak self] booleanVal in
                if booleanVal == true {
                    self?.signupButton.isEnabled = true
                } else {
                    self?.signupButton.isEnabled = false
                }
            }
            .store(in: &self.subscriptions)*/
        
        
        //Using Assign
        validationPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.isEnabled, on: signupButton)
            .store(in: &self.subscriptions)
    }

    @IBAction func signupButtonPressed(_ sender: UIButton) {
        print("enabled button")
    }
    /*@IBAction func usernameChanges(_ sender: UITextField) {
        usernameVal = sender.text ?? ""
    }*/
    @IBAction func nameChanges(_ sender: UITextField) {
        nameVal = sender.text ?? ""
    }
    @IBAction func addressChanges(_ sender: UITextField) {
        addressVal = sender.text ?? ""
    }
    @IBAction func usernameChanges(_ sender: UITextField) {
        usernameVal = sender.text ?? ""
    }
    
}

//MARK: UITextField Delegate Methods
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

