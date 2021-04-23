//
//  Extensions.swift
//  HolidaysMVVM-C
//
//  Created by Ali Elsokary on 23/04/2021.
//
//

import PKHUD

// MARK: - UIViewController
extension UIViewController {
    func showProgress() {
        HUD.show(.progress)
    }
    
    func hideProgress() {
        HUD.hide()
    }
    
    func showMessage(_ message: String) {
        HUD.flash(.labeledError(title: nil, subtitle: message), delay: 1.5)
    }
}

