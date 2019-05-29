//
//  ViewController.swift
//  addingnumber
//
//  Created by mac on 29/05/19.
//  Copyright © 2019 gammastack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var field1: UITextField!
    @IBOutlet weak var field2: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextfield()
        configureTapGesture()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func configureTextfield(){
        field1.delegate = self
        field2.delegate = self
        
    }
    private func configureTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
            view.addGestureRecognizer(tapGesture)
    }
    @objc func handleTap()  {
        view.endEditing(true)
        
    }
    
    
    @IBAction func button(_ sender: Any) {
        view.endEditing(true)
        let firstValue = Int(field1.text!)
        let secondvalue = Int(field2.text!)
        if(firstValue != nil && secondvalue != nil) {
        let output = Int(firstValue! + secondvalue!)
        label.text = " The Sum Is \(output)"
        }
        else{
            label.text = "Please Enter A Value"
        }
    }
    
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
