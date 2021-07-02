//
//  CustomAlert.swift
//  CustomAlert
//
//  Created by Masato Takamura on 2021/07/02.
//

import UIKit

final class CustomAlert {
    
    struct Constants {
        static let toBackgroundAlpha: CGFloat = 0.6
    }
    
    //Super View
    private var myTargetView: UIView?
    
    //Background View
    private let backgroundView: UIView = {
       let backgroundView = UIView()
        backgroundView.backgroundColor = .black
        backgroundView.alpha = 0
        return backgroundView
    }()
    
    //Alert View
    private let alertView: UIView = {
       let alert = UIView()
        alert.backgroundColor = .white
        alert.layer.masksToBounds = true
        alert.layer.cornerRadius = 10
        return alert
    }()
    ///Show Alert
    func showAlert(on viewController: UIViewController,
                   title: String,
                   message: String
                   ) {
        //Target View
        guard let targetView = viewController.view else { return }
        self.myTargetView = targetView
        //Background View
        backgroundView.frame = targetView.bounds
        targetView.addSubview(backgroundView)
        //Alert View
        alertView.frame = CGRect(x: 48,
                                 y: targetView.frame.size.height,
                                 width: targetView.frame.size.width - 96,
                                 height: 300)
        targetView.addSubview(alertView)
        //titleLabel
        let titleLabel = UILabel(frame: CGRect(x: 0,
                                               y: 0,
                                               width: alertView.frame.size.width,
                                               height: 60))
        titleLabel.text = title
        titleLabel.textColor = .darkGray
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textAlignment = .center
        alertView.addSubview(titleLabel)
        //messageLabel
        let messageLabel = UILabel(frame: CGRect(x: 8,
                                                 y: titleLabel.frame.size.height,
                                                 width: alertView.frame.size.width - 16,
                                                 height: 180))
        messageLabel.text = message
        messageLabel.textColor = .darkGray
        messageLabel.textAlignment = .left
        messageLabel.numberOfLines = 0
        alertView.addSubview(messageLabel)
        //First Button
        let firstButton = UIButton()
        firstButton.setTitle("H", for: .normal)
        firstButton.setTitleColor(.white, for: .normal)
        firstButton.backgroundColor = .systemOrange
        firstButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        //Second Button
        let secondButton = UIButton()
        secondButton.setTitle("E", for: .normal)
        secondButton.setTitleColor(.white, for: .normal)
        secondButton.backgroundColor = .systemGreen
        secondButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        //Third Button
        let thirdButton = UIButton()
        thirdButton.setTitle("L", for: .normal)
        thirdButton.setTitleColor(.white, for: .normal)
        thirdButton.backgroundColor = .systemPurple
        thirdButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        
        //Fourth Button
        let FourthButton = UIButton()
        FourthButton.setTitle("L", for: .normal)
        FourthButton.setTitleColor(.white, for: .normal)
        FourthButton.backgroundColor = .systemGray
        FourthButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        //Fifth Button
        let FifthButton = UIButton()
        FifthButton.setTitle("O", for: .normal)
        FifthButton.setTitleColor(.white, for: .normal)
        FifthButton.backgroundColor = .systemYellow
        FifthButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        
        //Button Stack View
        let buttonStackView = UIStackView(arrangedSubviews: [firstButton, secondButton, thirdButton, FourthButton, FifthButton])
        buttonStackView.frame = CGRect(x: 0, y: titleLabel.frame.size.height + messageLabel.frame.size.height, width: alertView.frame.size.width, height: 60)
        buttonStackView.axis = .horizontal
        buttonStackView.alignment = .fill
        buttonStackView.distribution = .fillEqually
        alertView.addSubview(buttonStackView)
        
        //Show Animation
        UIView.animate(withDuration: 0.3,
                       animations:  {
                        self.backgroundView.alpha = Constants.toBackgroundAlpha
                       }) { (done) in
            if done {
                UIView.animate(withDuration: 0.3, animations: {
                    self.alertView.center = targetView.center
                })
            }
        }
    }
    
    ///Dismiss Alert
    @objc
    func dismissAlert() {
        guard let targetView = myTargetView else { return }
        //Dismiss Animation
        UIView.animate(withDuration: 0.3,
                       animations:  {
                        self.alertView.frame = CGRect(x: 48,
                                                 y: targetView.frame.size.height,
                                                 width: targetView.frame.size.width - 96,
                                                 height: 300)
                       }) { (done) in
            if done {
                UIView.animate(withDuration: 0.3, animations: {
                    self.backgroundView.alpha = 0
                }) { (done) in
                    if done {
                        self.alertView.removeFromSuperview()
                        self.backgroundView.removeFromSuperview()
                    }
                }
            }
        }
    }
}
