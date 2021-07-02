//
//  Alert.swift
//  CustomAlert
//
//  Created by Masato Takamura on 2021/07/02.
//

import UIKit

final class DefaultAlert {
    ///OKアラート
    static func okAlert(vc: UIViewController, title: String, message: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: handler)
        alertController.addAction(okAction)
        vc.present(alertController, animated: true, completion: nil)
    }
    
    ///OK & Cancelアラート
    static func okCancelAlert(vc: UIViewController, title: String, message: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: handler)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        vc.present(alertController, animated: true, completion: nil)
    }
}

