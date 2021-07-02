//
//  ViewController.swift
//  CustomAlert
//
//  Created by Masato Takamura on 2021/07/02.
//

import UIKit

class MainViewController: UIViewController {
    
    private let customAlert = CustomAlert()
    
    @IBOutlet private weak var alertButton: UIButton! {
        didSet {
            alertButton.layer.cornerRadius = 10
            alertButton.addTarget(self, action: #selector(didTapAlertButton(_:)), for: .touchUpInside)
        }
    }
    
    @objc
    func didTapAlertButton(_ sender: UIButton) {
        //show alert
        customAlert.showAlert(on: self,
                              title: "Hello World",
                              message: "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
                              )
    }
}

