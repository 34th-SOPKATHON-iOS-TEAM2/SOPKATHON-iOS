//
//  UIViewController+.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by YOUJIM on 5/18/24.
//

import UIKit


// MARK: - 화면 여백 공간 눌렀을 때 키보드 숨길 수 있게 하는 extension
// hideKeyboard() 호출해서 사용함

extension UIViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
