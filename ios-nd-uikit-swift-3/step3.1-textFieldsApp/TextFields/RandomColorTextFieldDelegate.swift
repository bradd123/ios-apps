//
//  RandomColorTextFieldDelegate.swift
//  TextFields
//
//  Created by Brahma Reddy Chilakala on 16/11/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import Foundation
import UIKit

class RandomColorTextFieldDelegate: NSObject, UITextFieldDelegate {
    let colors: [UIColor] = [.red, .orange, .yellow, .green, .blue, .purple, .brown]
    
    func randomColor() -> UIColor {
        let randomIndex = Int(arc4random() % UInt32(colors.count))
        return colors[randomIndex]
    }
    
    func textField(_ textField:UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.textColor = randomColor()
        return true
    }
}
